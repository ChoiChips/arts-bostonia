require 'rails_helper'

describe Spot do
  test_user = User.new(email: "test@gmail.com", password: "password", password_confirmation: "password")
  test_spot = Spot.new(name: "Test name", location:"Test location", description: "Test description", photo: "Test photo", user: test_user)

  it "is valid with valid attributes" do
    expect(test_spot).to be_valid
  end

  it "is not valid without name" do
    test_spot.name = nil
    expect(test_spot.save).to eq(false)
    expect(test_spot.errors[:name]).to_not be_nil
  end

  it "is not valid without description" do
    test_spot.description = nil
    expect(test_spot.save).to eq(false)
    expect(test_spot.errors[:description]).to_not be_nil
  end

  it "is not valid without location" do
    test_spot.location = nil
    expect(test_spot.save).to eq(false)
    expect(test_spot.errors[:location]).to_not be_nil
  end

  it "should have many reviews" do
    t = Spot.reflect_on_association(:reviews)
    expect(t.macro).to eq(:has_many)
  end

  it "should belong to user" do
    t = Spot.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end
end
