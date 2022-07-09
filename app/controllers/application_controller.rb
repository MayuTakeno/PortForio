class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_admin_sign_in_path_for(resource)
    admin_root_path
  end

  def after_admin_sign_out_path_for(resource)
    new_admin_session_path
  end

  def after_employee_sign_in_path_for(resource)
    public_root_path
  end

  def after_employee_sign_up_path_for(resource)
    public_employee_path(current_employee)
  end

  def after_public_sign_out_path_for(resource)
    public_root_path
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :assigned_to, :employee_code, :phone_number])
  end

end
