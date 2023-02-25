# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :reject_user, only: [:create]

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
  protected
  
  def reject_user
    @customer = Customer.find_by(email: params[:customer][:email].downcase)
    if @customer
      if (@customer.valid_password?(params[:customer][:password]) && (@customer.active_for_authentication? == false))
        flash[:error] = "退会済みです。"
        redirect_to root_path
      end
    else
      flash[:error] = "必須項目を入力してください。"
    end
  end
  # # 退会しているかを判断するメソッド
  # def customer_state
  #   #入力されたemailからアカウントを1件取得
  #   @customer = Customer.find_by(email: params[:customer][:email])
  #   # アカウントを取得できなかった場合、このメソッドを終了する
  #   return if !@customer
  #   # 取得したアカウントのパスワードと入力されたパスワードが一致してるかを判別
  #   if @customer.valid_password?(params[:customer][:password]) && @customer.status
  #   # if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
  #     redirect_to new_customer_registration_path #サインアップに遷移
  #   end
  # end

  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number])
  # end
end
