Rails.application.routes.draw do
  #Game
  get '/games', to:'games#index'
  post '/games', to: 'games#create'
  get '/games/:id', to: 'games#show'
  delete '/games', to: 'games#destroy_all'
  delete '/games/low', to: 'games#delete_worst_game'
  delete '/games/:id', to: 'games#destroy'
  get '/games/top/:quantity', to: 'games#top'
  patch '/games/calification_update/:game_id', to: 'games#update_calification'
  #Player
  get '/players', to:'players#index'
  post '/players', to: 'players#create'
  post '/players/:game_id', to: 'players#create_player_with_game_id'
  get '/players/:player_id', to: 'players#show'
  delete '/players', to: 'players#destroy_all'
  get '/players/:player_id/game', to:'players#favourite_game'
  #Reviews
  get '/games/:id/reviews', to: 'reviews#show'
  post '/reviews', to: 'reviews#create'
  patch '/reviews/:review_id', to: 'reviews#update'
  get '/reviews/:game', to: 'reviews#show_with_game_id'
  get '/reviews/:review_id/player', to: 'reviews#player_by_review_id'
  get '/reviews', to: 'reviews#show_all'
end
