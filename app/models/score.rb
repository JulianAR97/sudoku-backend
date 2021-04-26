class Score < ApplicationRecord
  belongs_to :user
  scope :total, -> { count('*') }
  scope :total_by_difficulty, ->(difficulty) { where(difficulty: difficulty).count('*') }
  scope :top_ten_by_difficulty, ->(difficulty) { where(difficulty: difficulty).order('time').limit(10) }


  validates :difficulty, inclusion: { in: %w[easy medium hard expert] }
  # time refers to time taken to complete puzzle, not timestamp
  validates :time, presence: true
end
