# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :ensure_noaml_employee, only: :destroy


  def guest_sign_in
    employee = Employee.guest
    sign_in employee
    redirect_to public_employee_path(employee), notice: 'guestでログインしました。'
  end

  def ensure_noaml_employee
    if params[:employee][:email].downcase == 'guest@exam.com'
      redirect_to public_employee_path(employee)
    end
  end
  # GET /resource/sign_in
  # def new
  #   superz
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
end
