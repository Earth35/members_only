class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "You've successfully logged in."
      redirect_to '/'
    else
      flash.now[:danger] = "Invalid email and/or password."
      render 'new'
    end
  end
end
