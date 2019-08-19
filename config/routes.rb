Rails.application.routes.draw do

  root 'sessions#new'

  get 'sessions/new'
  get 'users/new'
  
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index  do
      resources :answers, shallow: true, except: :index
    end
    post :start, on: :member
  end

  resources :results, only: %i[ show update] do
    get :final, on: :member
  end
end
