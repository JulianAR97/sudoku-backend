class Score < ApplicationRecord
  belongs_to :user
  scope :top_ten, -> { order('time').limit(10) }
end
