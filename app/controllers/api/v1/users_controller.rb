class Api::V1::UsersController < ApplicationController
  before_action :fetch_user, only: [:log_in, :log_out]

  # user session is start
  def log_in
    unless params[:user][:password].present?
      return render json: { errors: [I18n.t('errors.user.password.presence')] }
    end
    
    return render json: { errors: I18n.t('errors.user.email.not_found') } unless @user

    if @user.valid_password?(params[:user][:password])
      sign_in("user", @user)
      return @user
    else
      return render json: { errors: I18n.t('errors.user.password.invalid') }
    end
  end

  # user session is close
  def log_out
    @user = User.find_by_email(params[:user][:email])
    
    unless @user
      return render json: { errors: I18n.t('errors.user.email.not_found') }
    else
      sign_out(@user)
      return render json: { success: I18n.t('success.user.logout.done'), status: 'ok' }
    end
  end

private
  
  # fetch user by given email
  def fetch_user
    unless params[:user][:email].present?
      return render json: { errors: [I18n.t('errors.user.email.presence')] }
    end
   
    @user = User.find_by_email(params[:user][:email])
  end
end
