FactoryBot.define do
  factory :movie do
    title { 'Get Out' }
    text { 'Now that Chris and his girlfriend, Rose, have reached the meet-the-parents milestone of dating, she invites him for a weekend getaway upstate with Missy and Dean...' }
    rating { 5 }
    category { FactoryBot.create(:category, :horror) }
  end
end
