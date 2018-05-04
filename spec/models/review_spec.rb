require 'rails_helper'

describe Review do
  test_user = User.new(email: "test@gmail.com", password: "password", password_confirmation: "password")
  test_spot = Spot.new(name: "Test name", location:"Test location", description: "Test description", photo: "Test photo", user: test_user)
  test_review = Review.new(description: "Test description", rating: 5, spot: test_spot, user: test_user)

  it "is valid with valid attributes" do
    expect(test_review).to be_valid
  end

  it "is not valid without description" do
    test_review.description = nil
    expect(test_review.save).to eq(false)
    expect(test_review.errors[:description]).to_not be_nil
  end

  it "is not valid without rating" do
    test_review.rating = nil
    expect(test_review.save).to eq(false)
    expect(test_review.errors[:rating]).to_not be_nil
  end

  it "should belong to user" do
    t = Review.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  it "should belong to spot" do
    t = Review.reflect_on_association(:spot)
    expect(t.macro).to eq(:belongs_to)
  end
end
