FactoryBot.define do
  factory :category do
    id { 1 }

    trait :horror do
      name { :horror }
    end
  end
end
