FactoryBot.define do
  factory :user do
    name { 'Jane Doe' }
    email { "jane@doe.com" }
    password { '123456' }
    password_confirmation { '123456' }

    trait :jack do
      name { 'Jack Doe' }
    end

    trait :john do
      name { 'John Doe' }
    end

    trait :jada do
      name { 'Jada Doe' }
    end
  end
end
