class Public::CalendarsController < ApplicationController

  def create
    calendar_new = current_employee.calendars.new(calendar_params)
    calendar_new.employee_id = current_employee.id
    calendar_new.save
    redirect_to public_employee_path(current_employee)
  end

  private

  def calendar_params
    params.permit(:title, :content, :start_time, :employee_id)
  end
end
