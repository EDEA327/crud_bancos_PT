Rails.application.routes.draw do
  devise_for :users
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'
  resources :banks
  resources :providers
end
