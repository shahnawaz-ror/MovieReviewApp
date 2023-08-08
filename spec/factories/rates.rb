# spec/factories/rates.rb

FactoryBot.define do
  factory :rate do
    rater_id { FactoryBot.create(:user).id }
    rateable_type { 'Movie' } # Adjust this based on your actual rateable types
    rateable_id { FactoryBot.create(:movie).id } # Adjust this based on your actual rateable objects
    stars { 4.5 } # Example value, adjust as needed
    dimension { 'rating' } # Example value, adjust as needed
    reviews { 'Great movie!' } # Example value, adjust as needed
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
