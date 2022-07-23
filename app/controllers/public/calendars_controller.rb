class Public::CalendarsController < ApplicationController

  def create
    @calendar = Calendar.new(calendar_params)
    @calendar.employee_id = current_employee.id
    if @calendar.save
      @calendars = Calendar.includes(:employee)
      redirect_to public_employee_path(current_employee)
    else
      render :validater
    end
  end

  def show
    @calendar = Calendar.find(params[:id])
    @calendars = Calendar.includes(:employee)
  end

  def destroy
    @calendar = Calendar.find(params[:id])
    @calendar.destroy
    redirect_to public_employee_path(current_employee)
  end

  private

  def calendar_params
    params.require(:calendar).permit(:start_time, :title, :content)
  end
end
