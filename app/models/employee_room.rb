class EmployeeRoom < ApplicationRecord
  # 社員とroomの中間テーブル

  # employeeを主キーとしたテーブルを参照先に指定
  belongs_to :employee
  # roomを主キーとしたテーブルを参照先に指定
  belongs_to :room

end
