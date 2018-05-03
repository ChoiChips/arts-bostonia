Rails.application.routes.draw do
  root "spots#index"

  devise_for :users

  namespace :api do
    namespace :v1 do

      resources :spots, only: [:index, :show] do
        resources :reviews, only: [:index, :create]
      end

<<<<<<< HEAD
      resources :users, only: [:index]

      # how do we nest; /users/spots, /users/shmugana
      # resources :users, only: [:index] do
      #   resources :spots, only: [:index]
      # end
=======
      resources :users, only: [:index, :show] do
        resources :spots, only: [:index]
      end
>>>>>>> bf60973a8758877e61f50dfe25c30eaa2881f4f1

      resources :reviews, only: [:index, :show, :create]
    end
  end

  resources :spots, only: [:index, :show, :create, :new, :edit, :update]

  resources :users, only: [:index, :destroy]

  get "*path", to: 'spots#index'
end
