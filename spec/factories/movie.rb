FactoryBot.define do
  factory :movie do
    title { "movie name" }
    description { "movie description" }
    url { "https://www.youtube.com/watch?v=fIip0BH6z7I" }
    user_id { create(:user) }
  end
end
