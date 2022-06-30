class Blog < ApplicationRecord

  has_one_attached :image
  belongs_to :employee

  validates :title, presence: true
  validates :body, presence: true
end
