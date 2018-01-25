FactoryBot.define do
  sequence :user do |n|
    username "codemonkey0#{n}"
    email "user#{n}@gmail.com"
    password "MyString"
    first_name "John"
    last_name "Doe"
  end
end
