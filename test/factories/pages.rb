FactoryGirl.define do
  factory :page do
    url 'http://example.com'
    content { Faker::Lorem.paragraph }
  end
end
