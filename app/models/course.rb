class Course < ApplicationRecord
  has_one_attached :course_img
  has_many :enrollments, dependent: :destroy
  has_many :units, dependent: :destroy
  validates :name, presence: true
  has_many :solutions, through: :units
  has_many :activities, through: :units
end
