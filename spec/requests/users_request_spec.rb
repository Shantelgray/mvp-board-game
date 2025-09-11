require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }

  describe "GET /users" do
    it "returns http success" do
      get users_path
      expect(response).to have_http_status(:success)
    end

    it "displays all users" do
      user1 = FactoryBot.create(:user, name: "Test User 1")
      user2 = FactoryBot.create(:user, name: "Test User 2")
      get users_path
      expect(response.body).to include(user1.name)
      expect(response.body).to include(user2.name)
    end
  end

  describe "GET /users/:id" do
    it "returns http success" do
      get user_path(user)
      expect(response).to have_http_status(:success)
    end

    it "displays the user's details" do
      get user_path(user)
      expect(response.body).to include(user.name)
      expect(response.body).to include(user.email)
    end

    it "shows the user's total points" do
      FactoryBot.create(:score, user: user, points: 100)
      FactoryBot.create(:score, user: user, points: 150)
      get user_path(user)
      expect(response.body).to include("Total Points: 250")
    end

    it "shows the user's top game" do
      game = FactoryBot.create(:game, name: "Top Game")
      FactoryBot.create(:score, user: user, game: game, points: 1000)
      get user_path(user)
      expect(response.body).to include("Top Game")
    end
  end

  describe "GET /users/:id/edit" do
    context "when signed in as the correct user" do
      before { sign_in user }

      it "returns http success" do
        get edit_user_path(user)
        expect(response).to have_http_status(:success)
      end
    end

    context "when signed in as a different user" do
      before { sign_in other_user }

      it "redirects with an alert" do
        get edit_user_path(user)
        expect(response).to redirect_to(users_path)
        expect(flash[:alert]).to eq("Not authorized")
      end
    end
  end

  describe "PATCH /users/:id" do
    let(:valid_attributes) { { name: "Updated Name", email: "updated@example.com" } }

    context "when signed in as the correct user" do
      before { sign_in user }

      it "updates the user" do
        patch user_path(user), params: { user: valid_attributes }
        expect(response).to redirect_to(user_path(user))
        expect(flash[:notice]).to eq("Profile updated successfully")
        user.reload
        expect(user.name).to eq("Updated Name")
      end

      it "renders edit on invalid attributes" do
        patch user_path(user), params: { user: { name: "" } }
        expect(response).to render_template(:edit)
      end
    end

    context "when signed in as a different user" do
      before { sign_in other_user }

      it "redirects with an alert" do
        patch user_path(user), params: { user: valid_attributes }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("Not authorized")
      end
    end
  end
end
