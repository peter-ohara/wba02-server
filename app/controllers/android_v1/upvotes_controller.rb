class AndroidV1::UpvotesController < ApplicationController
  before_action :set_upvote, only: [:show, :update, :destroy]

  # POST /upvotes
  def create
    @upvote = Upvote.new(upvote_params)

    if @upvote.save
      render json: @upvote.comment, status: :created, location: @upvote
    else
      render json: @upvote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /upvotes/1
  def destroy
    @upvote.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_upvote
    @upvote = Upvote.where(user: @current_user, comment_id: params[:id]).first
  end

  # Only allow a trusted parameter "white list" through.
  def upvote_params
    checked_params = params.require(:upvote).permit(:comment_id)

    { user_id: @current_user.id, comment_id: checked_params[:comment_id] }
  end
end
