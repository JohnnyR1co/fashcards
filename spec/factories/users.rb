FactoryGirl.define do
  factory :user do
    email "ruby@rails.rb"
    password "password"
    password_confirmation "password"
  end
end
