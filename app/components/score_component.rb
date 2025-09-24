# frozen_string_literal: true

class ScoreComponent < ViewComponent::Base
  attr_reader :score, :game

  def initialize(score:, game:)
    @score = score
    @game = game
  end
end
