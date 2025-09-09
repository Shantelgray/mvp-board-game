require 'rails_helper'
RSpec.describe User, type: :model do
  it { should have_many(:scores) }
  it { should have_many(:games).through(:scores) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }

  let(:user) { FactoryBot.create(:user) }
  let(:game1) { FactoryBot.create(:game, name: "Chess") }
  let(:game2) { FactoryBot.create(:game, name: "Checkers") }
  let!(:score1) { FactoryBot.create(:score, points: 50, user: user, game: game1) }
  let!(:score2) { FactoryBot.create(:score, points: 80, user: user, game: game2) }

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
