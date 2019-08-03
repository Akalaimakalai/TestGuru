Rails.application.routes.draw do

  root to: 'tests#index'

  resources :tests

  get '/tests/:category/:title', to: 'tests#search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
