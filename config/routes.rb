Rails.application.routes.draw do
  root 'spots#index'
  devise_for :users
  resources :spots
end
