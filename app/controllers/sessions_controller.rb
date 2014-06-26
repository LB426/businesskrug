class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      user.groupcheck
      user.groupadd('autologin')

      if cookies[:uid] != user.unique_id
        lie_user = User.find_by_unique_id(cookies[:uid])
        cookies.delete :uid
        lie_user.delete unless lie_user.nil?
        cookies[:uid] = {
          :value => user.unique_id,
          :expires => 1.year.from_now,
          :path => '/'
        }
      end

      if  user.nick.nil? || user.nick.empty? || 
          user.gender.nil? || user.gender.empty? || 
          user.email.nil? || user.email.empty? ||
          user.locality.nil? || user.locality.empty?
        msg = t('default.please')+' '+t('default.fill')+' '+t('default.your2')+' '+t('default.profile')+' '+t('default.completely')
        flash[:notice] = msg
        redirect_to edit_user_path(user)
      else
        redirect_to home_path
      end
      
    else
      redirect_to login_path, :alert => "Неверный номер телефона или пароль"
    end
  end

  def destroy
    current_user.groupdel('autologin')
    session[:user_id] = nil
    cookies.delete :uid
    reset_session
    redirect_to root_path
  end

end
