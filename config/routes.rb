Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { registrations: 'users/registrations',
                                    sessions: 'users/sessions' }

  devise_scope :users do
    get '/gurus', to: 'users/sessions#new'
  end
            

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :results, only: %i[ show update] do
    get :final, on: :member
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index  do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
