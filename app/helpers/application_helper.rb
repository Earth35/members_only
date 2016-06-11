module ApplicationHelper
  def log_in (user)
    fresh_token = SecureRandom.urlsafe_base64
    token_digest = User.digest(fresh_token)
    user.update_attribute(:remember_token, token_digest)
    cookies.permanent[:remember_token] = fresh_token
    current_user
  end
  
  def log_out
    cookies.delete(:remember_token)
    @current_user = nil
    redirect_to login_path
  end
  
  def current_user
    return nil if cookies[:remember_token].nil?
    @current_user ||= User.find_by(remember_token: User.digest(cookies[:remember_token]))
  end
  
  def logged_in?
    current_user
  end
end
