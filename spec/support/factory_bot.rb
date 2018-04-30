require 'factory_bot'

FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  # factory :spot do
  #   sequence(:name) {|n| "Test spot #{n}" }
  #   location 'Test location'
  #   description 'Test description'
  #   photo 'Test photo'
  #   user_id
  # end
  # factory :review do
  #   sequence(:user_id) {|n| n }
  #   description 'Test description'
  #   rating 5
  # end
end
