require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let(:returned_json) { JSON.parse(response.body) }


  describe "GET#index" do
    describe "returns review data" do
      it "first test" do
        test_user = User.create!(email: "test@gmail.com", password: "password", password_confirmation: "password")
        test_spot = Spot.create!(name: "Test name", location:"Test location", description: "Test description", photo: "Test photo", user: test_user)
        test_review = Review.create!(description: "Test description", rating: 5, spot: test_spot, user: test_user)

        get :index

        expect(response.status).to eq 200
        expect(response.content_type).to eq("application/json")

        expect(returned_json.first.keys).to eq ["id", "name", "photo", "artist"]
        expect(returned_json.first["id"]).to eq(test_review.id)
      end

    end
  end


end
