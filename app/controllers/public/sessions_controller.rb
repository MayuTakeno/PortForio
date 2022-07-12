# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  # before_action :ensure_noaml_employee, only: :destroy

  def after_sign_in_path_for(resource)
    public_employee_path(current_employee)
  end

  def after_sign_out_path_for(resource)
    new_employee_session_path
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
