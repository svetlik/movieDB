FactoryBot.define do
  factory :user do
    name { 'Jane Doe' }
    email { "jane@doe.com" }
    password { '123456' }
    password_confirmation { '123456' }

    trait :jack do
      name { 'Jack Doe' }
      email { "jack@doe.com" }
    end

    trait :john do
      name { 'John Doe' }
      email { "john@doe.com" }
    end

    trait :jada do
      name { 'Jada Doe' }
      email { "jada@doe.com" }
    end
  end
end
