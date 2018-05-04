require 'rails_helper'

describe User do
  it "should have many spots" do
    t = User.reflect_on_association(:spots)
    expect(t.macro).to eq(:has_many)
  end

  it "should have many reviews" do
    t = User.reflect_on_association(:reviews)
    expect(t.macro).to eq(:has_many)
  end
end
