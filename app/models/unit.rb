class Unit < ApplicationRecord
  belongs_to :course
  has_one_attached :unit_img
  has_many :activities, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true
  has_many :solutions, through: :activities
end
