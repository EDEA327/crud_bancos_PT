Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  root 'home#index'
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'
  resources :banks
  resources :providers
end
