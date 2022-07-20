# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :employee_status, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :ensure_noaml_employee, only: :destroy

  def after_employee_sign_in_path_for(resource)
    public_employee_path(current_employee)
  end

  protected

  def employee_status
    # 入力されたemailからアカウントを１件取得
    @employee = Employee.find_by(email: params[:employee][:email])
    # アカウントを取得できなければメソッド終了
    return if !@employee
    # 取得したアカウントのパスワードと入力されたパスワードが一致しているかを判別
    if @employee.valid_password?(params[:employee][:password]) && @employee.is_deleted == false
      flash[:notice] = "退会済みのため、再登録が必要です。"
      redirect_to new_employee_registration_path
      # end
    end
  end

  # def ensure_noaml_employee
  #   if params[:employee][:email].downcase == 'guest@exam.com'
  #     redirect_to public_employee_path(employee)
  #   end
  # end
  # GET /resource/sign_in
  # def new
    # public_root_path
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end



  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
