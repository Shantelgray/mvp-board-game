require "rails_helper"
RSpec.describe "Games", type: :request do
  let!(:game) { FactoryBot.create(:game) }

  describe "GET /games" do
    it "returns all games" do
      get games_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(game.name)
    end
  end

  describe "GET /games/:id" do
    it "returns the specific game" do
      get game_path(game)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(game.name)
      expect(response.body).to include(game.genre)
    end
  end
end
