class Score < ApplicationRecord
  belongs_to :user
  scope :total, -> { count('*') }
  scope :total_by_difficulty, ->(difficulty) { where(difficulty: difficulty).count('*') }
  scope :top_ten_by_difficulty, ->(difficulty) { where(difficulty: difficulty).order('time').limit(10) }
  
  def self.average_by_difficulty(difficulty)
    times = where(difficulty: difficulty).map(&:time)
    # Avoid times by 0 error
    return '' if (times.length === 0)
    total_time = 0
    times.each do |time|
      mins_secs = time.split(':')
      total_time += (mins_secs[0].to_i * 60) + (mins_secs[1].to_i)
    end
    average = total_time / times.size
    "#{average / 60}:#{average % 60}"
  end


  validates :difficulty, inclusion: { in: %w[easy medium hard expert] }
  # time refers to time taken to complete puzzle, not timestamp
  validates :time, presence: true
end


# 359 299, 334 330.6667