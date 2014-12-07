FactoryGirl.define do
  factory :user do
    name "test_user"
    email "test_user@example.com"
    password "test-password"
    password_confirmation "test-password"
  end
end
