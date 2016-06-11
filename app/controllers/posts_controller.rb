class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  
  def new
    @post = Post.new
  end

  def index
  end
  
  def create
    @post = Post.new(post_params)
    @post.user_id = @current_user.id
    if @post.save
      flash[:success] = "New post has been successfully created."
      redirect_to posts_index_path
    else
      flash.now[:error] = "Couldn't create new post."
      render 'new'
    end
  end
  
  private
  
    def require_login
      unless logged_in?
        flash[:error] = "Please log in."
        redirect_to login_path
      end
    end
    
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
