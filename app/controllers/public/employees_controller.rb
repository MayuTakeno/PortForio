class Public::EmployeesController < ApplicationController
  before_action :authenticate_employee!
  before_action :set_employee, only: [:show, :edit]

  def edit
  end

  def updated
  end

  def show
  end

  private
  def set_employee
    @employee = current_employee
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :assigned_to, :employee_code, :phone_number, :is_deleted, :email)
  end
end
