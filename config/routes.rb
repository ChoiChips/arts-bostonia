Rails.application.routes.draw do
  root "spots#index"

  devise_for :users

  namespace :api do
    namespace :v1 do

      resources :spots, only: [:index, :show] do
        resources :reviews, only: [:index, :create]
      end

      resources :reviews, only: [:index, :show, :create] do
        resources :votes, only: [:index, :create]
      end

      resources :users, only: [:show] do
        resources :spots, only: [:index]
      end

      resources :reviews, only: [:index, :show, :create]
    end
  end

  resources :spots, only: [:index, :show, :create, :new, :edit, :update]

  get "*path", to: 'spots#index'
end
