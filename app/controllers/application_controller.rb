class ApplicationController < ActionController::Base

  # employeeとadminのログアウト後の遷移先指定
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :employee
      public_root_path
    elsif resource_or_scope == :admin
      public_root_path
    else
      root_path
    end
  end

end
