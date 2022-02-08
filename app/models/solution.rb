class Solution < ApplicationRecord
  belongs_to :enrollment
  belongs_to :activity
  has_one_attached :file
  validates :activity,
            uniqueness: { scope: :enrollment, message: "a user can only have a unique solution per activity" }
  validates :file, :activity, :enrollment, presence: true
end
