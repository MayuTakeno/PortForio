class Public::CalendarsController < ApplicationController

  def create
    calendar = current_employee.calendars.new(calendar_params)
    calendar.employee_id = current_employee.id
    calendar.save
    redirect_to public_employee_path(current_employee)
  end

  private

  def calendar_params
    params.permit(:title, :content, :start_time, :employee_id)
  end
end
