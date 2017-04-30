FactoryGirl.define do
  factory :shoe do
    name { Faker::Pokemon.name }
    brand { Faker::Company.name }
    model { Faker::Vehicle.vin }
    size_class :men
  end
end
