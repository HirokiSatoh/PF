# frozen_string_literal: true

class UserDevises::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  before_action :reject_user, only: [:create]
  def after_sign_in_path_for(resource)
    flash[:notice] = "ログインに成功しました。"
    root_path
  end
  def after_sign_out_path_for(resource)
    flash[:notice] = "ログアウトに成功しました。"
    root_path
  end
  def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:password])
  end
end