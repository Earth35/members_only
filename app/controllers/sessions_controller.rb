class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      flash[:success] = "You've successfully logged in."
      redirect_to posts_index_path
    else
      flash.now[:error] = "Invalid email and/or password."
      render 'new'
    end
  end
  
  def destroy
    log_out if !current_user.nil?
  end
end
