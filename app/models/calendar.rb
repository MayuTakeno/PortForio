class Calendar < ApplicationRecord

  belongs_to :employee

  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true

end
