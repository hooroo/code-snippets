FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "codemonkey#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    first_name "Foo"
    last_name "Bar"
  end

  factory :snippet do
    user nil
    title "title"
    body "content"
  end
end
