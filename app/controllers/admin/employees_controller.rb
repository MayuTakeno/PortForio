class Admin::EmployeesController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_employee, only: [:show, :edit]

  def index
    @employees = Employee.includes(:admin)
  end

  def edit
  end

  def show
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
