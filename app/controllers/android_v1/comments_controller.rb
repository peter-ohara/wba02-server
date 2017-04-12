class AndroidV1::CommentsController < ApplicationController
  before_action :set_comment, only: [:update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all

    render json: @comments
  end

  # GET /comments/1
  def show
    @comments = Comment.where(user_id: @current_user.id,
                              commentable_id: params[:id])
    render json: @comments
  end

  def get_formatted_comment(raw_comment)
    raw_comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
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
    checked_params = params.require(:comment).permit(:id,
                                    :user_id,

                                    :commentable_type,
                                    :commentable_id,

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

    { user_id: @current_user.id,
      content: checked_params[:content],
      commentable_type: checked_params[:commentable_type],
      commentable_id: checked_params[:commentable_id],
      parent_id: checked_params[:parent] }
  end
end
