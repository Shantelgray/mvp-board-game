class User < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_many :games, through: :scores

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  def total_points
    scores.sum(:points)
  end

  def top_game
    scores.order(points: :desc).first&.game
  end

  def total_points
    scores.sum(:points)
  end
end
