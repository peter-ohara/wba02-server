class AndroidV1::StoreScreenController < ApplicationController
  def index
    @courses = Course.order(:code)

    render json: @courses
  end

  def show
  end
end
