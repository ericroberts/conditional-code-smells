FactoryGirl.define do
  factory :product do
    sequence(:name) { |n| "Name #{n}" }
  end
end
