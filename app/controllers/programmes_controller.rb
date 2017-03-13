class ProgrammesController < ApplicationController
  before_action :set_programme, only: [:show, :update, :destroy]

  # GET /programmes
  def index
    @programmes = Programme.all

    render json: @programmes
  end

  # GET /programmes/1
  def show
    render json: @programme
  end

  # POST /programmes
  def create
    @programme = Programme.new(programme_params)

    if @programme.save
      render json: @programme, status: :created, location: @programme
    else
      render json: @programme.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /programmes/1
  def update
    if @programme.update(programme_params)
      render json: @programme
    else
      render json: @programme.errors, status: :unprocessable_entity
    end
  end

  # DELETE /programmes/1
  def destroy
    @programme.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_programme
      @programme = Programme.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def programme_params
      params.require(:programme).permit(:name, :school_id)
    end
end
