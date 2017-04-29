FactoryGirl.define do
  factory :access_token do
    user { create(:user) }
    kind "web"
  end
end
