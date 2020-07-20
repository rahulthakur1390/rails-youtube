FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test-#{n.to_s.rjust(3, "0")}@user.com"}
    password {"password"}
  end
end