module ApplicationHelper
  def log_in (user)
    fresh_token = SecureRandom.urlsafe_base64
    token_digest = User.digest(fresh_token)
    user.update_attribute(:remember_token, token_digest)
    cookies.permanent[:remember_token] = fresh_token
    current_user
  end
  
  def log_out
    session[:user_id] = nil
  end
  
  def current_user
    return nil if User.find_by(remember_token: User.digest(cookies[:remember_token])).nil?
    @current_user ||= User.find_by(remember_token: User.digest(cookies[:remember_token]))
  end
end
