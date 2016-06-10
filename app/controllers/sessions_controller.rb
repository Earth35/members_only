class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "You've successfully logged in"
      # redirect_to root_path
    else
      #re-render
    end
  end
end
