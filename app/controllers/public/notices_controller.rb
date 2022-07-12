class Public::NoticesController < ApplicationController
  # before_action :authenticate_employee!, only: [:show]

  def index
    @notices = Notice.includes(:admin).order(created_at: :desc)
    if params[:word].present?
      @notices = Notice.where("title LIKE?", "%#{params[:word]}%").order(created_at: :desc)
    end
  end

  def show
    @notice = Notice.find(params[:id])
  end

end
