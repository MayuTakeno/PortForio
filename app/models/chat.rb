class Chat < ApplicationRecord
  belongs_to :employee

  validates :title, presence: true
  validates :body, presence: true
end
