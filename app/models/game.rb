class Game < ApplicationRecord
  has_many :scores
  has_many :users, through: :scores
  validates :name, presence: true
end
