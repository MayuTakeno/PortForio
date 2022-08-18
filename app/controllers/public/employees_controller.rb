class Public::EmployeesController < ApplicationController
  before_action :authenticate_employee!, only: [:edit, :update, :show]
  before_action :set_employee, only: [:show, :edit, :update]

  def edit
    redirect_to public_employee_path(current_employee) unless employee_signed_in? && current_employee.id == @employee.id && @employee.first_name != "guest" && @employee.last_name != "tarou"
  end

  def update
    @employee = current_employee
    if @employee.update(employee_params)
      redirect_to public_employee_path(@employee)
    else
      render :edit
    end
  end

  def show
    @calendars = Calendar.includes(:employee)
    @calendar = Calendar.new
    @calendar = @calendars.build(employee_id: current_employee.id) if current_employee
  end

  def favorites
    @employee = Employee.find(params[:id])
    favorites = Favorite.where(employee_id: @employee.id).pluck(:blog_id)
    @favorite_blogs = Blog.find(favorites)
  end


  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :assigned_to, :employee_code, :phone_number, :is_deleted, :email)
  end


end