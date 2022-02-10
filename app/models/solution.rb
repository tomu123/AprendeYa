class Solution < ApplicationRecord
  after_commit :update_final_grade
  belongs_to :enrollment
  belongs_to :activity
  has_one_attached :file
  validates :activity,
            uniqueness: { scope: :enrollment, message: "a user can only have a unique solution per activity" }
  validates :file, :activity, :enrollment, presence: true

  private

  def update_final_grade
    solutions = enrollment.solutions.where.not(score: nil)
    if solutions.empty?
      enrollment.update(final_grade: nil)
    else
      scores = solutions.to_a.map { |s| s.score }
      sum = scores.inject(:+)
      final_grade = sum / scores.size
      enrollment.update(final_grade: final_grade)
    end
  end
end
