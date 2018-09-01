FactoryBot.define do
  factory :category do
    id { 1 }

    trait :horror do
      name { :horror }
    end

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
