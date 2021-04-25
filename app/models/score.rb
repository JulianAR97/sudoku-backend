class Score < ApplicationRecord
  belongs_to :user
  scope :top_ten, -> { order('time').limit(10) }

  validates :difficulty, inclusion: { in: %w[easy medium hard expert] }
  # time refers to time taken to complete puzzle, not timestamp
  validates :time, presence: true
end
