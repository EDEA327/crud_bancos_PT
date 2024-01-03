Rails.application.routes.draw do
  get '/dashboard', to: 'dashboard#show', as: 'dashboard'
  resources :banks
  resources :providers
end
