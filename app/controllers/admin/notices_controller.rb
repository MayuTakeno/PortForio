class Admin::NoticesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notices_params)
    @notice.admin_id = current_admin.id
    if @notice.save
      redirect_to admin_notices_path
    else
      render :new
    end
  end

  def index
    @notices = Notice.includes(:admin).order(created_at: :desc)
    if params[:word].present?
      @notices = Notice.where("title LIKE?", "%#{params[:word]}%")
    end
  end

  def show
  end

  def edit
  end

  def update
    if @notice.update(notices_params)
      redirect_to admin_notice_path(@notice)
    else
      render :edit
    end
  end

  def destroy
    @notice.destroy
    redirect_to admin_notices_path
  end

  private

  def notices_params
    params.require(:notice).permit(:title, :body, :caption, :image)
  end

  def set_notice
    @notice = Notice.find(params[:id])
  end
end
