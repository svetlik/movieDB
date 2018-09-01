FactoryBot.define do
  factory :rating do
    score { 1 }
    movie
    user

    trait :two do
      score { 2 }
    end

    trait :three do
      score { 3 }
    end

    trait :four do
      score { 4 }
    end

    trait :five do
      score { 5 }
    end
  end
end
