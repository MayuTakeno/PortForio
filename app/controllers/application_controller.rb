class ApplicationController < ActionController::Base

  def after_public_sign_out_path_for(resource)
    public_root_path
  end

end
