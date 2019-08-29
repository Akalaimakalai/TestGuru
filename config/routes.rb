Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'users/registrations' }

  resources :tests, only: :index do
    resources :questions, shallow: true, except: :index  do
      resources :answers, shallow: true, except: :index
    end
    post :start, on: :member
  end

  resources :results, only: %i[ show update] do
    get :final, on: :member
  end

  namespace :admin do
    resources :tests
  end
end
