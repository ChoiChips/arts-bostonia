require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do

  user1 = FactoryBot.create(:user)
  user2 = FactoryBot.create(:user)
  # spot1 = FactoryBot.create(:spot)
  # binding.pry
  # review1 = FactoryBot.create(:review)
  # review2 = FactoryBot.create(:review)

  # let!(:user1) { User.create!(email: "testemail1@example.com", password: "password", password_confirmation: "password")}
  # let!(:user2) { User.create!(email: "testemail2@example.com", password: "password", password_confirmation: "password")}
  let!(:test_spot) { Spot.create!(name: "Test name", location:"Test location", description: "Test description", photo: "Test photo",user: user1)}
  let!(:first_review) { Review.create!(description: "Test description", rating: 5, spot: test_spot, user: user1) }
  let!(:second_review) { Review.create!(description: "Test description", rating: 5, spot: test_spot, user: user2) }

  describe "GET#index" do
    it "should return a list of all the reviews" do
      get :index
      returned_json = JSON.parse(response.body)
    end

    # need to clarify how the reviews are ordered
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

  # describe "POST#create" do
  #   it "creates a new Review" do
  #     post_json = { description: "Test description", rating: 5 }.to_json
  #
  #     prev_count = Review.count
  #     post(:create, body: post_json)
  #     expect(Review.count).to eq(prev_count + 1)
  #   end
  #
  #   it "returns the json of the newly posted review" do
  #
  #     post_json = { description: "Test description", rating: 5 }.to_json
  #
  #     post(:create, body: post_json)
  #     returned_json = JSON.parse(response.body)
  #     expect(response.status).to eq 200
  #     expect(response.content_type).to eq("application/json")
  #
  #     expect(returned_json).to be_kind_of(Hash)
  #     expect(returned_json).to_not be_kind_of(Array)
  #     expect(returned_json["description"]).to eq "Test description"
  #     expect(returned_json["rating"]).to eq 5
  #   end
  # end
end
