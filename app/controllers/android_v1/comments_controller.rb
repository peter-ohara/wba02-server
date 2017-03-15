class AndroidV1::CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  def get_formatted_comment(raw_comment)
    raw_comment
  end

  # POST /comments
  def create
    get_comment_from_params

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def get_comment_from_params
    @comment = Comment.new
    @comment.user_id = 1 # get_current_user
    @comment.content = comment_params[:content]
    @comment.commentable_type = 'Comment'
    @comment.commentable_id = comment_params[:parent]
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(user_id: 1,
                       content: comment_params[:content],
                       commentable_type: 'Comment',
                       commentable_id: comment_params[:parent])
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def comment_params
    params.require(:comment).permit(:id,
                                    :user_id,

                                    :parent,

                                    :created,
                                    :modified,

                                    :content,

                                    :file,
                                    :file_url,
                                    :file_mime_type,
                                    :fullname,
                                    :profile_url,
                                    :profile_picture_url,
                                    :created_by_admin,
                                    :created_by_current_user,
                                    :upvote_count,
                                    :user_has_upvoted)
  end
end
