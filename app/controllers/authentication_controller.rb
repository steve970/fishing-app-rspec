class AuthenticationController < ApplicationController

  def index
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to rivers_path
    else
      flash[:message] = "YOU CAN\'T PUT THAT SHIT IN THERE! TRY AGAIN!"
      render :index
    end
  end



end
