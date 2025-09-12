require "rails_helper"

RSpec.describe Score, type: :model do
  let!(:low_score) { FactoryBot.create(:score, points: 62, user: user, game: game) }
  let!(:high_score) { FactoryBot.create(:score, points: 132, user: user, game: game) }
  let(:game) { FactoryBot.create(:game) }
  let(:user) { FactoryBot.create(:user) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:game) }
  it { is_expected.to validate_presence_of(:points) }

  describe "scopes" do
    it "returns only scores with points > 100" do
      expect(described_class.high_scores).to include(high_score)
      expect(described_class.high_scores).not_to include(low_score)
    end

    it "returns only the scores with points <= 100" do
      expect(described_class.low_scores).to include(low_score)
      expect(described_class.low_scores).not_to include(high_score)
    end
  end

  describe "#top_score" do
    it "returns the score with the highest points" do
      expect(described_class.top_score).to eq(high_score)
    end
  end

  describe "validations" do
    it "is valid with zero points" do
      score = described_class.new(points: 0, user: user, game: game, round_number: 1)
      expect(score).to be_valid
    end

    it "is invalid without a round_number" do
      score = described_class.new(points: 50, user: user, game: game, round_number: nil)
      expect(score).not_to be_valid
    end
  end
end
