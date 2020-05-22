Rails.application.routes.draw do
  root 'studios#index'

  get '/studios', to: 'studios#index'
  get '/movies/:movie_id', to: 'movies#show'
  post '/movies/:movie_id', to: 'movie_actors#create'
end
