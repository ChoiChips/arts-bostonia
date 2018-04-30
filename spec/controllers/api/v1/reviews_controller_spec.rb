require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :controller do
  user1 = FactoryBot.create(:user)
  user2 = FactoryBot.create(:user)
  let!(:test_spot) { Spot.create (
    name: 'Little Ducklings',
    location:'Boston Common, Boston MA',
    description: 'all the ducks',
    photo: 'https://cdn1.sph.harvard.edu/wp-content/uploads/sites/48/2012/09/make-way-for-ducklings-5.jpg')
  }
  let!(:first_review) { Review.create(description: "Test description", rating: 5, spot_id: 1, user_id: 1) }
  let!(:second_review) { Review.create(description: "Test description", rating: 5, spot_id: 1, user_id: 2) }

  describe "GET#index" do
    it "should return a list of all the reviews" do

      get :index
      returned_json = JSON.parse(response.body)

    end
  end
end
