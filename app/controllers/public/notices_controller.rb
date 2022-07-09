class Public::NoticesController < ApplicationController
  # before_action :authenticate_employee!, only: [:show]

  def index
    @notices = Notice.all.order(created_at: :desc)
  end

  def show
    @notice = Notice.find(params[:id])
  end

end
