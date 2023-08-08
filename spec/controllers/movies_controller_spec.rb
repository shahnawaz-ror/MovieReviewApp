# spec/controllers/movies_controller_spec.rb

require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  include Devise::Test::ControllerHelpers
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @movies' do
      movie = create(:movie)
      get :index
      expect(assigns(:movies)).to eq([movie])
    end

    it 'assigns @movies filtered by actor_name' do
      actor_name = 'Johnny Depp'
      movie = create(:movie, actor: actor_name)
      get :index, params: { actor_name: actor_name }
      expect(assigns(:movies)).to eq([movie])
    end

    it 'sorts movies by title' do
      movie1 = create(:movie, title: 'Movie B')
      movie2 = create(:movie, title: 'Movie A')
      get :index, params: { sort: 'title' }
      expect(assigns(:movies)).to eq([movie2, movie1])
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      movie = create(:movie)
      get :show, params: { id: movie.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #rate' do
    it 'updates the review of a rate' do
      user = create(:user)
      movie = create(:movie)
      rate = create(:rate, rater: user, rateable: movie)
      new_review = 'Great movie!'
      sign_in(user)
      post :rate, params: { id: movie.id, review: new_review }
      expect(rate.reload.reviews).to eq(new_review)
      expect(response).to have_http_status(:ok)
    end
  end

  # More test cases for other controller actions (create, update, destroy) can be added here.
end
