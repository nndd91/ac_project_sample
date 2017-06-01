FactoryGirl.define do
  factory :penguin do
    head 2
    hand 2
    foot 2

    trait :invalid do
      head nil
    end
  end
end
