class Unit < ApplicationRecord
  belongs_to :course
  has_one_attached :unit_img
  has_many :activities
  validates :title, presence: true
  validates :description, presence: true
end
