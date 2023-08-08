require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        title: "Title",
        description: "MyText",
        movie_year: 2,
        actor: "Actor",
        filming_location: "Filming Location",
        country: "Country"
      ),
      Movie.create!(
        title: "Title",
        description: "MyText",
        movie_year: 2,
        actor: "Actor",
        filming_location: "Filming Location",
        country: "Country"
      )
    ])
  end
end
