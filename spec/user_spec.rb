require "rails_helper"
RSpec.describe User, type: :model do
  let!(:score2) { FactoryBot.create(:score, points: 80, user: user, game: game2) }
  let!(:score1) { FactoryBot.create(:score, points: 50, user: user, game: game1) }
  let(:game2) { FactoryBot.create(:game, name: "Checkers") }
  let(:game1) { FactoryBot.create(:game, name: "Chess") }
  let(:user) { FactoryBot.create(:user) }

  it { is_expected.to have_many(:scores) }
  it { is_expected.to have_many(:games).through(:scores) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }

  describe "#total_points" do
    it "returns the sum of all points for the user" do
      expect(user.total_points).to eq(130)
    end
  end

  describe "#top_game" do
    it "returns the game with the highest score" do
      expect(user.top_game).to eq(game2)
    end
  end
end
