class Score < ApplicationRecord
  belongs_to :user
  belongs_to :game
  validates :points, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :high_scores, -> { where("points > 100") }
  scope :low_scores, -> { where("points <= 100") }

  def self.top_score
    order(points: :desc).first
  end
end
