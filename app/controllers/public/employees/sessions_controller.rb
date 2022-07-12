class Public::Employees::SessionsController < Devise::SessionsController

  def guest_sign_in
    employee = Employee.guest
    sign_in employee
    redirect_to public_employee_path(employee), notice: 'guestでログインしました。'
  end

end