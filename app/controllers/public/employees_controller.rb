class Public::EmployeesController < ApplicationController
  before_action :authenticate_employee!, only: [:edit, :update, :show]
  before_action :set_employee, only: [:show, :edit, :update]

  def edit
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
    @employee.blogs = Blog.includes(:employee)
    @calendars = Calendar.includes(:employee)
    @calendar = Calendar.new
    # @calendar = @calendars.build(employee_id: current_employee.id) if current_employee
  end

  private

  def set_employee
    @employee = current_employee
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :assigned_to, :employee_code, :phone_number, :is_deleted, :email)
  end

end