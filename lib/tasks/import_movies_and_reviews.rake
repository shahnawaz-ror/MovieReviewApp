# lib/tasks/import_movies_and_reviews.rake

require 'csv'

namespace :import do
  desc "Import movies and reviews from CSV files"
  task movies_and_reviews: :environment do
    movies_file_path = 'public/temp_csv/movies.csv'  # Replace with the actual path to your movies CSV file
    reviews_file_path = 'public/temp_csv/reviews.csv'  # Replace with the actual path to your reviews CSV file

    CSV.foreach(movies_file_path, headers: true) do |row|
      movie = Movie.new(
        title: row['Movie'],
        description: row['Description'],
        movie_year: row['Year'],
        director: row['Director'],
        actor: row['Actor'],
        filming_location: row['Filming location'],
        country: row['Country']
      )

      if movie.save
        puts "Movie '#{movie.title}' saved successfully."
      else
        puts "Error saving movie '#{movie.title}': #{movie.errors.full_messages.join(', ')}"
      end
    end

    CSV.foreach(reviews_file_path, headers: true) do |row|
      movie = Movie.find_or_create_by(title: row['Movie'])
      user = User.find_or_create_by_name(row['User'])
      review = movie.review_rates.build(rater_id: user.id, stars: row['Stars'], reviews: row['Review'])
      if review.save
        puts "Movie '#{review.id}' and review saved successfully."
      else
        puts "Unable to save movie '#{review.id}': #{review.errors.full_messages.join(', ')}"
      end
    end
  end
end
