class Game < ApplicationRecord
  has_many :scores
  has_many :users, through: :scores
  validates :name, presence: true
  validates :genre, presence: true

  scope :by_genre, ->(genre) { where(genre: genre) }

  def top_score
    scores.order(points: :desc).first
  end

  def scores_high_to_low
    scores.order(points: :desc)
  end

  def top_user_score
    top_score&.user
  end

  def self.game_of_genre(genre)
    by_genre(genre)
  end

  def games_played
    scores.includes(:game).map { |score| { game: score.game.name, points: score.points } }
  end
end
