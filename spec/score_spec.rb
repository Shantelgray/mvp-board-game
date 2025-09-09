 require 'rails_helper'

 RSpec.describe Score, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:game) }
  it { should validate_presence_of(:points) }


   let(:user) { FactoryBot.create(:user) }
   let(:game) { FactoryBot.create(:game) }
   let!(:high_score) { FactoryBot.create(:score, points: 132, user: user, game: game) }
   let!(:low_score) { FactoryBot.create(:score, points: 62, user: user, game: game) }

   describe "scopes" do
     it "returns only scores with points > 100" do
     expect(Score.high_scores).to include(high_score)
     expect(Score.high_scores).not_to include(low_score)
     end

     it "returns only the scores with points <= 100" do
      expect(Score.low_scores).to include(low_score)
      expect(Score.low_scores).not_to include(high_score)
     end
   end

   describe "#top_score" do
    it "returns the score with the highest points" do
    expect(Score.top_score).to eq(high_score)
    end
   end

  describe "validations" do
   it "is valid with zero points" do
    score = Score.new(points: 0, user: user, game: game)
    expect(score).to be_valid
  end
  end
end
