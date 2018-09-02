FactoryBot.define do
  factory :category do
    id { 1 }
    name { 'Horror' }

    trait :action do
      name { :action }
    end

    trait :comedy do
      name { :comedy }
    end

    trait :animation do
      name { :animation }
    end
  end
end
