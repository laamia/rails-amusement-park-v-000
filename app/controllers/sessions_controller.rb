class SessionsController < ApplicationController
  def new
    @user = User.find_by(:name => params[:name])
  end
  def create
    @user = User.find_by(name: params[:user][:name])
    #return head(:forbidden) unless @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    if !session[:user_id] || session[:user_id] == ''
      redirect_to '/signin'
    else
      redirect_to user_path(@user)
    end
  end

  def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
