FactoryGirl.define do
  factory :pricing do
    dtstart 1.month.ago
    dtend   1.month.from_now
    price   100

    association :product
  end
end
