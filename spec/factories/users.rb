FactoryBot.define do
  factory :user do
    name { 'Jack Doe' }
    email { 'jd@example.com' }
    password { '123456' }
    password_confirmation { '123456' }
  end
end
