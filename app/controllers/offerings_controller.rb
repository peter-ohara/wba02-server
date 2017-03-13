class OfferingsController < ApplicationController
  before_action :set_offering, only: [:show, :update, :destroy]

  # GET /offerings
  def index
    @offerings = Offering.all

    render json: @offerings
  end

  # GET /offerings/1
  def show
    render json: @offering
  end

  # POST /offerings
  def create
    @offering = Offering.new(offering_params)

    if @offering.save
      render json: @offering, status: :created, location: @offering
    else
      render json: @offering.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /offerings/1
  def update
    if @offering.update(offering_params)
      render json: @offering
    else
      render json: @offering.errors, status: :unprocessable_entity
    end
  end

  # DELETE /offerings/1
  def destroy
    @offering.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offering
      @offering = Offering.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def offering_params
      params.require(:offering).permit(:programme_id, :course_id)
    end
end
