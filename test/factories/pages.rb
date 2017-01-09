FactoryGirl.define do
  factory :page do
    url 'http://example.com'
    content({ url: '', h1: [], links: [] })
  end
end
