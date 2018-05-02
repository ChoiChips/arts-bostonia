require "rails_helper"

RSpec.describe Api::V1::SpotsController, type: :controller do

  test_user = User.create!(email: "test@gmail.com", password: "password", password_confirmation: "password")
  let!(:test_spot1) { Spot.create!(name: "Test name1", location:"Test location", description: "Test description", photo: "Test photo", user: test_user)}
  let!(:test_spot2) { Spot.create!(name: "Test name2", location:"Test location", description: "Test description", photo: "Test photo", user: test_user)}
  let!(:test_spot3) { Spot.create!(name: "Test name3", location:"Test location", description: "Test description", photo: "Test photo", user: test_user)}

  describe "GET#index" do
    it "should return a list of all the reviews" do
      get :index
      returned_json = JSON.parse(response.body)
    end

    it "should return a list of all the spots ordered by date" do
      get :index
      returned_json = JSON.parse(response.body)

      expect(response.status).to eq 200
      expect(response.content_type).to eq("application/json")

      expect(returned_json.length).to eq 3
      expect(returned_json[0]["name"]).to eq "Test name1"
      expect(returned_json[1]["name"]).to eq "Test name2"
      expect(returned_json[2]["name"]).to eq "Test name3"
    end
  end
end
