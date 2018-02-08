FactoryBot.define do
  factory :comment do
    body "comment"
    association :commentable, factory: :snippet
  end

  factory :language do
    name "ruby"
  end

  factory :snippet do
    user
    language
    title "title"
    body "content"
  end

  factory :tag do
    name "backend"
  end

  factory :user do
    sequence(:username) { |n| "codemonkey#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password "password"
    first_name "Foo"
    last_name "Bar"
  end
end
