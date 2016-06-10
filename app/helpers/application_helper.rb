module ApplicationHelper
  def log_in (user)
    session[:user_id] = user.id
    fresh_token = SecureRandom.urlsafe_base64
    token_digest = Digest::SHA1.hexdigest(fresh_token)
    user.update_attribute(:remember_token, token_digest)
    cookies.permanent[:remember_token] = fresh_token
  end
  
  def log_out
    session[:user_id] = nil
  end
end
