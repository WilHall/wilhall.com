require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :issues, only: %i[create]
    end
  end

  namespace :admin do
    resources :clients, except: [:destroy]
    resources :users, except: [:destroy]
    resources :writings
    resources :presses

    root to: "clients#index"

    mount Sidekiq::Web => "/sidekiq"
  end

  namespace :api do
    namespace :v1 do
    end
  end

  namespace :user do
    resources :events
  end

  resource :about, only: [:show]
  resources :writings, only: [:index]
  resources :presses, only: [:index]
  resource :store, only: [:show]
  resource :contact, only: [:show]
  resource :purpose, only: [:show]
  root to: 'abouts#show'
end
