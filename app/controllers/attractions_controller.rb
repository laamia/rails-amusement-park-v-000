class AttractionsController < ApplicationController
  def new
    @attraction = Attraction.new
  end
  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end
  def edit
    @attraction = Attraction.find(params[:id])
  end

  def index
    @user = User.find(session[:user_id])
  end
  def show
    @attraction = Attraction.find(params[:id])
    @user = User.find(session[:user_id])
    session[:attraction_id] = params[:id]
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name)
  end
end
