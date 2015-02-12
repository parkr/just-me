Rails.application.routes.draw do
  resources :users
  resources :posts

  match '/auth/:service/callback' => 'services#create', via: %i(get post)
  match '/auth/failure' => 'services#failure', via: %i(get post)
  match '/logout' => 'sessions#destroy', via: %i(get delete), as: :logout

  resources :services, only: %i(index create destroy)

  get '/hubot/info' => 'application#status_check'

  root to: "posts#index"
end
