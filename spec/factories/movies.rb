# spec/factories/movies.rb

FactoryBot.define do
  factory :movie do
    title { 'Sample Movie' }
    description { 'A great movie' }
    movie_year { 2023 }
    actor { 'Johnny Depp' }
    filming_location { 'Hollywood' }
    country { 'USA' }
    director { 'James Cameron' }
  end
end
