class Game < ApplicationRecord
  has_many :scores
  has_many :users, through: :scores
  validates :name, presence: true
  validates :genre, presence: true

  def top_score
    scores.order(points: :desc).first
  end

  def top_user_score
    top_score&.user
  end
end
