Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  devise_scope :user do
    get '/gurus', to: 'users/registrations#new'
  end

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :results, only: %i[ show update] do
    member do
      get :final
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index  do
        resources :answers, shallow: true, except: :index
      end
    end

    resources :gists, shallow: true, only: %i[ index destroy ]
  end
end
