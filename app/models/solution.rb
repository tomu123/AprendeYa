class Solution < ApplicationRecord
  belongs_to :enrollment
  belongs_to :activity
  has_one_attached :file
end
