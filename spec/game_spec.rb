 require 'rails_helper'

 RSpec.describe Game, type: :model do
  it { should have_many(:scores) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:genre) }

  let!(:game) { FactoryBot.create(:game, name: "Chess", genre: "Strategy") }

  it "has the correct name and genre" do
    expect(game.name.downcase).to eq("chess")
    expect(game.genre).to eq("Strategy")
  end
 end
