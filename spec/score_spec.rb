 require 'rails_helper'

 RSpec.describe Score, type: :model do
   describe ".high_scores" do
   let(:user) { FactoryBot.create(:user) }
   let(:game) { FactoryBot.create(:game) }
   let(:high_score) { FactoryBot.create(:score, points: 132, user: user, game: game) }
   let(:low_score) { FactoryBot.create(:score, points: 62, user: user, game: game) }

     it "returns only scores with points > 100 points" do
     expect(Score.high_scores).to include(high_score)
     expect(Score.high_scores).not_to include(low_score)
     end
   end
 end
