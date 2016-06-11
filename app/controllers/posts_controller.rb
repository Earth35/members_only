class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  
  def new
  end

  def index
  end
  
  def create
  end
  
  private
  
    def require_login
      unless logged_in?
        flash[:error] = "Please log in."
        byebug
        redirect_to login_path
      end
    end
end
