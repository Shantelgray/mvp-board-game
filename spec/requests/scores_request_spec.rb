require "rails_helper"

RSpec.describe "Scores", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:game) { FactoryBot.create(:game) }
  let!(:score) { FactoryBot.create(:score, game: game, user: user) }

  before { login_as(user, scope: :user) }

  def expect_score(score)
    expect(response.body).to include(score.points.to_s)
  end

  describe "GET /scores" do
    it "returns all scores" do
      get scores_path
      expect(response).to have_http_status(:ok)
      expect_score(score)
    end
  end

  describe "GET /users/:user_id/scores" do
    it "returns scores for a user" do
      get user_scores_path(user)
      expect(response).to have_http_status(:ok)
      expect_score(score)
    end
  end

  describe "GET /games/:game_id/scores" do
    it "returns scores for a game" do
      get game_scores_path(game)
      expect(response).to have_http_status(:ok)
      expect_score(score)
    end
  end

  describe "GET /games/:game_id/scores/new" do
    it "renders the new score form" do
      get new_game_score_path(game)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("New Score")
    end
  end

  describe "POST /games/:game_id/scores" do
    context "with valid params" do
      it "creates a new score" do
        expect do
          post game_scores_path(game), params: { score: { points: 250, round_number: 3 } }
        end.to change(Score, :count).by(1)
        expect(response).to redirect_to(game_score_path(game, Score.last))
        follow_redirect!
        expect(response.body).to include("250")
      end
    end

    context "with invalid params" do
      it "does not create a score" do
        expect do
          post game_scores_path(game), params: { score: { points: nil, round_number: 3 } }
        end.not_to change(Score, :count)
        expect(response).to have_http_status(:ok)
        expect(response.body).to include("error")
      end
    end
  end
end
