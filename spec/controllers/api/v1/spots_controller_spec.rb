require "rails_helper"

RSpec.describe Api::V1::SpotsController, type: :controller do

  let!(:test_spot1) { Spot.create!(name: "Test name", location:"Test location", description: "Test description", photo: "Test photo")}
  let!(:test_spot2) { Spot.create!(name: "Test name", location:"Test location", description: "Test description", photo: "Test photo")}
  let!(:test_spot3) { Spot.create!(name: "Test name", location:"Test location", description: "Test description", photo: "Test photo")}

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

      # Note: because of serializer, only name, photo, and artist(optional) are returned
      expect(returned_json.length).to eq 3
      expect(returned_json[0]["name"]).to eq "Test name"
      expect(returned_json[0]["photo"]).to eq "Test photo"

      expect(returned_json[1]["name"]).to eq "Test name"
      expect(returned_json[1]["photo"]).to eq "Test photo"

      expect(returned_json[2]["name"]).to eq "Test name"
      expect(returned_json[2]["photo"]).to eq "Test photo"
    end
  end
end
