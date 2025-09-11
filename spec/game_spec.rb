require "rails_helper"

RSpec.describe Game, type: :model do
  let!(:game) { FactoryBot.create(:game, name: "Chess", genre: "Strategy") }
  let!(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:score1) { FactoryBot.create(:score, points: 90, user: user1, game: game) }
  let!(:score2) { FactoryBot.create(:score, points: 140, user: user2, game: game) }
  let!(:score3) { FactoryBot.create(:score, points: 140, user: user1, game: game) }

  # Associations and validations
  it { is_expected.to have_many(:scores) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:genre) }

  describe "attributes" do
    it "has the correct name and genre" do
      expect(game.name.downcase).to eq("chess")
      expect(game.genre).to eq("Strategy")
    end
  end

  describe "top_score and top_user_score" do
    it "returns the top score and its user, handling ties correctly" do
      top = game.top_score
      expect(top.points).to eq(140)
      expect(top).to eq(score2)
      expect(game.top_user_score).to eq(top.user)
    end
  end

  describe "top_user_score" do
    it "returns the user with the highest score" do
      expect(game.top_user_score).to eq(user2)
    end
  end

  describe "games_played" do
    it "returns an array of game names and points" do
      result = game.games_played
      expect(result).to include({ game: game.name, points: 90 })
      expect(result).to include({ game: game.name, points: 140 })
    end
  end

  context "when there are no scores" do
    let(:empty_game) { FactoryBot.create(:game) }

    it "returns nil for top_score" do
      expect(empty_game.top_score).to be_nil
    end

    it "returns nil for top_user_score" do
      expect(empty_game.top_user_score).to be_nil
    end
  end
end
