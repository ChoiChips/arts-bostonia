Rails.application.routes.draw do
  root "spots#index"

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :spots, only: [:index, :show] do
        resources :reviews, only: [:index, :create]
      end
    end
  end

  get "*path", to: 'spots#index'

  # resources :spots, only: [:index,:show, :create]
end
