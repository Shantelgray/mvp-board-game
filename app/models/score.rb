class Score < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
