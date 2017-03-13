class DownvotesController < ApplicationController
  before_action :set_downvote, only: [:show, :update, :destroy]

  # GET /downvotes
  def index
    @downvotes = Downvote.all

    render json: @downvotes
  end

  # GET /downvotes/1
  def show
    render json: @downvote
  end

  # POST /downvotes
  def create
    @downvote = Downvote.new(downvote_params)

    if @downvote.save
      render json: @downvote, status: :created, location: @downvote
    else
      render json: @downvote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /downvotes/1
  def update
    if @downvote.update(downvote_params)
      render json: @downvote
    else
      render json: @downvote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /downvotes/1
  def destroy
    @downvote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_downvote
      @downvote = Downvote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def downvote_params
      params.require(:downvote).permit(:user_id, :comment_id)
    end
end
