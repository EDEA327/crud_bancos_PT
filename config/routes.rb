Rails.application.routes.draw do
  root 'home#index'
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'
  devise_for :users
  resources :banks
  resources :providers
end
