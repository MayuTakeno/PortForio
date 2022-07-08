class Public::NoticesController < ApplicationController
  # before_action :authenticate_employee!, only: [:show]

  def index
    @notices = Notice.all
  end

  def show
    @notice = Notice.find(params[:id])
  end

end
