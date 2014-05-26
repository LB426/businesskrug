class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :authenticated_user?
  helper_method :authorize
  helper_method :admin?
  helper_method :marked_user
  helper_method :create_unreg_user_and_set_uid_cookies

private
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    @current_user
  end

  def marked_user
    @marked_user
  end

  def authorize
    unless current_user
      flash[:alert] = "For use this option - authorize!"
      redirect_to login_path
    end
  end

  def authenticated_user?
    unless current_user.nil?
      return true 
    end
    flash[:notice] = t('default.you_must_be_logged_in_to_complete_this_action')
    redirect_to login_path
    return false
  end

  def admin?
    if current_user.group.include? 'admin'
      return true
    else
      return false
    end
  end

  def random_string(size = 32)
    chars = (('a'..'z').to_a + ('0'..'9').to_a)
    (1..size).collect{|a| chars[rand(chars.size)] }.join
  end

  def random_digit_str(size = 9)
    chars = ('0'..'9').to_a
    (1..size).collect{|a| chars[rand(chars.size)] }.join
  end

  def create_unreg_user(phone = nil)
    user = User.new
    user.phone = phone
    rnd_str = random_digit_str(6)
    rnd_text = BCrypt::Engine.hash_secret(random_string, BCrypt::Engine.generate_salt)
    user.unique_id = rnd_text
    user.password_open_text = rnd_str
    user.password = rnd_str
    user.group = 'unregistered'
    ip = request.remote_ip if ENV["RAILS_ENV"] == "development"
    ip = request.env["HTTP_X_FORWARDED_FOR"] if ENV["RAILS_ENV"] == "production"
    user.last_ip = ip
    user.save(validate: false)
    user
  end

  def create_unreg_user_and_set_uid_cookies
    user = create_unreg_user
    cookies[:uid] = {
      :value => user.unique_id,
      :expires => 1.year.from_now,
      :path => '/'
    }
  end

  def process_user_state(user)
  end

  def mark
    if cookies[:uid].nil?
      create_unreg_user_and_set_uid_cookies()
    else
      user = User.find_by_unique_id(cookies[:uid])
      unless user.nil?
        logger.debug "this user is marked"
        @marked_user = user
        if user.group.include? 'autologin'
          session[:user_id] = user.id
          process_user_state(user)
        end
      else
        logger.debug "cookie uid - lie!"
        flash[:notice] = "Your have defect cookies. Please authenticate with your login and password."
        cookies.delete :uid
        redirect_to login_path
      end
    end
  end
  
end
