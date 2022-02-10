class Enrollment < ApplicationRecord
  belongs_to :student, class_name: "User", foreign_key: "user_id"
  belongs_to :course
  has_many :solutions
  validates :student,
            uniqueness: { scope: :course, message: "a student can only register one time for a course" }
end
