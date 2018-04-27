Rails.application.routes.draw do
  root 'spots#index'
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :spots, only: [:index,:show]
    end
  end

  resources :spots, only: [:index, :show, :create, :new]
end
