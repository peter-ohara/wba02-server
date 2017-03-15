class AndroidV1::TakeQuizScreenController < ApplicationController
  # GET /android_v1/take_quiz_screen
  def index
    render json: []
  end

  # GET /android_v1/take_quiz_screen/1
  def show
    @quiz = Quiz.find(params[:id])

    quiz_id = params[:id]

    quiz_contents = []
    quiz_contents = add_quiz_contents(quiz_contents, MultipleChoiceQuestion.where(quiz_id: quiz_id))
    quiz_contents = add_quiz_contents(quiz_contents, FillInQuestion.where(quiz_id: quiz_id))
    quiz_contents = add_quiz_contents(quiz_contents, EssayQuestion.where(quiz_id: quiz_id))
    quiz_contents = add_quiz_contents(quiz_contents, Header.where(quiz_id: quiz_id))

    quiz_contents.sort_by! { |k| k[:priority] }

    result = {
      title: @quiz.name,
      quiz_contents: quiz_contents
    }

    render json: result
  end

  private

  def add_quiz_contents(quiz_contents, query_results)
    query_results.each do |quiz_content|
      content = {}
      content[:id] = quiz_content.id
      content[:priority] = quiz_content.priority
      content[:type] = get_quiz_content_type(quiz_content)
      content[:title] = quiz_content.is_a?(Header) ? quiz_content.title : quiz_content.number
      content[:content] = quiz_content.is_a?(Header) ? quiz_content.content : quiz_content.question
      content[:choices] = quiz_content.choices if quiz_content.is_a?(MultipleChoiceQuestion)
      content[:comments] = get_formatted_comments(quiz_content.comments)
      content[:answers] = []
      quiz_contents.push(content)
    end
    quiz_contents
  end

  def get_formatted_comments(raw_comments)
    # id                      // Required
    # parent                  // Required if replying is enabled
    # created                 // Required
    # modified                // Required if editing is enabled
    # content                 // Either content or fileURL must be present
    # fileURL                 // Either content or fileURL must be present
    # file                    // Required when uploading an attachment
    # fileMimeType            // Optional
    # pings                   // Required if pinging is enabled
    # creator                 // Required if pinging is enabled
    # fullname                // Required
    # profileURL              // Optional
    # profilePictureURL       // Optional
    # createdByAdmin          // Optional
    # createdByCurrentUser    // Required if editing is enabled
    # upvoteCount             // Required if upvoting is enabled
    # userHasUpvoted          // Required if upvoting is enabled

    formatted_comments = []
    raw_comments.each do |raw_comment|
      formatted_comment = {}
      formatted_comment[:id] = raw_comment.id
      formatted_comment[:created] = raw_comment.created_at
      formatted_comment[:modified] = raw_comment.updated_at
      formatted_comment[:content] = raw_comment.content
      # formatted_comment[:fileUrl] = raw_comment.file.url if it is a file
      # formatted_comment[:file] = raw_comment.file if it is a file
      # formatted_comment[:fileMimeType] = raw_comment.file if it is a file
      formatted_comment[:fullname] = raw_comment.user.display_name
      # formatted_comment[:profileURL] = raw_comment.user.url
      # formatted_comment[:profilePictureURL] = raw_comment.user.profile_picture_url
      # formatted_comment[:createdByAdmin] = raw_comment.content
      formatted_comment[:createdByCurrentUser] = true # correct this
      formatted_comment[:upvoteCount] = raw_comment.upvotes.count
      formatted_comment[:userHasUpvoted] = false # correct this
      formatted_comments.push(formatted_comment)
    end
    formatted_comments
  end

  def get_quiz_content_type(quiz_content)
    if quiz_content.is_a?(Header)
      'Header'
    elsif quiz_content.is_a?(EssayQuestion)
      'EssayQuestion'
    elsif quiz_content.is_a?(FillInQuestion)
      'FillInQuestion'
    elsif quiz_content.is_a?(MultipleChoiceQuestion)
      'MultipleChoiceQuestion'
    end
  end
end
c