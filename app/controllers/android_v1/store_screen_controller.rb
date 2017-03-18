class AndroidV1::StoreScreenController < ApplicationController
  def index
    @courses = Course.all

    render json: @courses
  end

  def show
  end
end
