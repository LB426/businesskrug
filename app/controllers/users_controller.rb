class UsersController < ApplicationController
  before_filter :mark

  def registration
    @user = User.new
  end

  def registration_confirm
    @user = User.find_by_id(marked_user.id)
  end

  def edit
    @user = User.find_by_id(marked_user.id)
  end

  def create
    @user = User.find_by_id(marked_user.id)
    @user.password = params[:user][:password_open_text]
    @user.group = 'registered'
    if @user.update(user_params)
      redirect_to users_registration_confirm_path
    else
      render 'registration'
    end
  end

  def regconfirm
    redirect_to home_path
  end

  def update
    @user = current_user
    unless params[:user][:password_open_text].nil?
      @user.password = params[:user][:password_open_text]
    end
    if @user.update(user_params)
      flash.now[:alert] = "Ваш профиль обновлён успешно"
      render 'edit'
    else
      render 'edit'
    end
  end

  def password_recovery
  end

  def password_send
    unless params[:phone].empty?
      @user = User.find_by_phone(params[:phone])
      if @user
        if Rails.env.development? 
          flash.now[:alert] = "Пароль отправлен по СМС #{@user.password_open_text}"
        else
          flash.now[:alert] = "Пароль отправлен по СМС"
        end
      else
        flash.now[:alert] = "Учётная запись для телефона #{params[:phone]} не найдена"
      end
    else
      unless params[:email].empty?
        @user = User.find_by_email(params[:email])
        if @user
          if Rails.env.development? 
            flash.now[:alert] = "Пароль отправлен по email: #{@user.email} #{@user.password_open_text}"
          else
            flash.now[:alert] = "Пароль отправлен на email: #{@user.email}"
          end
          PasswordRecoveryMailer.recovery_pwd(@user).deliver
        else
          flash.now[:alert] = "Учётная запись для email #{params[:email]} не найдена"
        end
      end
    end
    render 'password_recovery'
  end

private
  def user_params
    params.require(:user).permit( :phone, :password_open_text, :nick,
                                  :gender, :email, :locality, :birthday, :avatar )
  end

end
