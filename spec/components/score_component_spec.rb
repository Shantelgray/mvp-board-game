# frozen_string_literal: true

require "rails_helper"

RSpec.describe ScoreComponent, type: :component do
  let(:score) { FactoryBot.create(:score, points: 100, round_number: 3) }

  it "render component with the points and round number" do
    render_inline(described_class.new(score: score, game: score.game))

    expect(page).to have_text("Points")
    expect(page).to have_text("Round")
  end
end
