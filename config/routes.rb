Rails.application.routes.draw do

  root 'sessions#new'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :sessions, to: 'sessions#new'
  get :users, to: 'users#new'

  resources :users, only: :create
  resources :sessions, only: :create

  delete :logout, to: 'sessions#destroy'

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
