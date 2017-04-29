FactoryGirl.define do
  factory :user do
    pw = Faker::Internet.password
    username { Faker::Internet.user_name(5..8, %w()) }
    password pw
    password_confirmation pw
    shoe_size { Faker::Number.between(5, 12) }
    status :user
  end
end
