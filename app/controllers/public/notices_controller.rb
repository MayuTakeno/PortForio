class Public::NoticesController < ApplicationController
  before_action :authenticate_employee!, except: [:index]

  def index
    @notices = Notice.includes(:admin).page(params[:page]).order(created_at: :desc)
    if params[:word].present?
      @notices = Notice.where("title LIKE?", "%#{params[:word]}%").page(params[:page]).order(created_at: :desc)
    end
  end

  def show
    @notice = Notice.find(params[:id])
  end

end
