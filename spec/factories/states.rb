FactoryGirl.define do
  factory :state do
    name                { 'Assembled' }
    sequence(:order, 0) { |n| n }
    model
  end
end
