FactoryBot.define do
  factory :like do
    user_id { create(:user) }
    movie_id { create(:movie) }
  end
end
