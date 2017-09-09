class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    @user.save
    session[:user_id] = @user.id
    redirect_to user_path(@user)
  end

  def show
    if session[:user_id]
      if session[:attraction_id]
        @attraction = Attraction.find(session[:attraction_id])
        @ride = Ride.find_or_create_by(user_id: session[:user_id], attraction_id: session[:attraction_id])
        @results = @ride.take_ride
      end
      @user = User.find(params[:id])
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
  end
end
