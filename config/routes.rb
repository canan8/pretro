Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :index]
  root 'welcome#index'
  get 'teams', to: 'teams#index'
  post 'login', to: 'sessions#create'
end
