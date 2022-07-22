class Public::CalendarsController < ApplicationController

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.employee_id = current_employee.id
    if @calendar.save
      @calendars = Calendar.includes(:employee)
    else
      render :validater
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:start_time, :title, :content)
  end
end
