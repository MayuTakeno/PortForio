class ApplicationController < ActionController::Base

  def after_public_sign_in_path_for(resource)
    public_root_path
  end

  def after_sign_up_path_for(resource)
    public_employee_path
  end

  def after_public_sign_out_path_for(resource)
    public_root_path
  end

end
