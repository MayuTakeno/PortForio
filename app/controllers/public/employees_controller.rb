class Public::EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit]

  def edit
  end

  def show
  end

  private
  def set_employee
    @employee = current_employee
  end
end
