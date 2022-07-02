class Admin::NoticesController < ApplicationController
  before_action :set_notice, only: [:show, :edit, :update, :destroy]

  def new
    @notice = Notice.new
  end

  def create
    @notice = Notice.new(notices_params)
    if @notice.save
      redirect_to admin_notices_path
    else
      render :new
    end
  end

  def index
    @notices = Notice.all
  end

  def show
  end

  def edit
  end

  private

  def notices_params
    params.require(:notice).permit(:title, :body, :caption, :image)
  end

  def set_notice
    @notice = Notice.find(params[:id])
  end
end
