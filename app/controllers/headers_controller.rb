class HeadersController < ApplicationController
  before_action :set_header, only: [:show, :update, :destroy]

  # GET /headers
  def index
    @headers = Header.all

    render json: @headers
  end

  # GET /headers/1
  def show
    render json: @header
  end

  # POST /headers
  def create
    @header = Header.new(header_params)

    if @header.save
      render json: @header, status: :created, location: @header
    else
      render json: @header.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /headers/1
  def update
    if @header.update(header_params)
      render json: @header
    else
      render json: @header.errors, status: :unprocessable_entity
    end
  end

  # DELETE /headers/1
  def destroy
    @header.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_header
      @header = Header.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def header_params
      params.require(:header).permit(:quiz_id, :priority, :title, :content)
    end
end
