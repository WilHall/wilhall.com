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
    resources :photos
    resources :presses
    resources :clays
    resources :glazes
    resources :glaze_combinations
    resources :terrariums, only: [:index, :show]
    resources :soils
    resources :decorations
    resources :succulents

    root to: 'clients#index'

    mount Sidekiq::Web => '/sidekiq'
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
  resource :photography, only: [:show]
  resource :lessons, only: [:show]
  resource :studio_share, only: [:show]
  resource :studio, only: [:show]
  resource :kiln_share, only: [:show]
  resource :terrarium_workshops, only: [:show]
  resources :terrariums, except: [:destroy]
  resource :store, only: [:show]
  resource :contact, only: [:show]
  resource :purpose, only: [:show]
  root to: 'abouts#show'
end
