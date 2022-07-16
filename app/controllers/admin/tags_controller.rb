class Admin::TagsController < ApplicationController
  before_action :set_tag, except: [:new, :index, :create]

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      redirect_to admin_tags_path
    else
      render :new
    end

  end

  def index
    @tags = Tag.all.page(params[:page])
  end

  def edit
  end

  def update
    @tag.save
    redirect_to admin_tags_path
  end

  def destroy
    @tag.destroy
    redirect_to admin_tags_path
  end

  private

  def set_tag
    @tag = Tag.find(params[:id])
  end

  def tag_params
    params.require(:tag).permit(:tag_name)
  end

end
