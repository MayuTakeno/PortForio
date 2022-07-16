class Admin::EmployeesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_employee, only: [:show, :edit, :update]

  def index
    @employees = Employee.all.page(params[:page])
  end

  def edit
  end

  def update
    @employee.update(employee_params)
    redirect_to admin_employee_path(@employee.id)
  end

  def show
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :phone_number, :assigned_to, :employee_code, :email, :is_deleted)
  end
end
