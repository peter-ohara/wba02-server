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
      content[:comments] = quiz_content.comments
      content[:answers] = []
      quiz_contents.push(content)
    end
    quiz_contents
  end

  def get_quiz_content_type(quiz_content)
    if quiz_content.is_a?(Header)
      :header
    elsif quiz_content.is_a?(EssayQuestion)
      :essay_question
    elsif quiz_content.is_a?(FillInQuestion)
      :fill_in_question
    elsif quiz_content.is_a?(MultipleChoiceQuestion)
      :multiple_choice_question
    end
  end
end
