# spec/models/movie_spec.rb

require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'search_by_actor_name scope' do
    it 'returns movies with matching actor names' do
      movie1 = create(:movie, actor: 'Johnny Depp')
      movie2 = create(:movie, actor: 'Leonardo DiCaprio')
      movie3 = create(:movie, actor: 'Keanu Reeves')
      movie4 = create(:movie, actor: 'Brad Pitt')

      # Perform the search using the scope
      search_results = Movie.search_by_actor_name('DiCaprio')

      # Ensure the correct movies are returned
      expect(search_results).to include(movie2)
      expect(search_results).not_to include(movie1, movie3, movie4)
    end
  end
end
