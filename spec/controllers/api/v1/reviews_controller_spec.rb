require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do

  user1 = FactoryBot.create(:user)
  user2 = FactoryBot.create(:user)

  let!(:test_spot) { Spot.create!(name: "Test name", location:"Test location", description: "Test description", photo: "Test photo")}
  let!(:first_review) { Review.create!(description: "Test description", rating: 5, spot: test_spot, user: user1) }
  let!(:second_review) { Review.create!(description: "Test description", rating: 5, spot: test_spot, user: user2) }

  describe "GET#index" do
    it "should return a list of all the reviews" do
      get :index
      returned_json = JSON.parse(response.body)
    end

    it "should return a list of all the reviews ordered by date" do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 2
      expect(returned_json[0]["description"]).to eq "Test description"
      expect(returned_json[0]["rating"]).to eq 5

      expect(returned_json[1]["description"]).to eq "Test description"
      expect(returned_json[1]["rating"]).to eq 5
    end
  end
end
