Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :users
  resources :events
  resources :user_events, only: %i[update destroy]
end
