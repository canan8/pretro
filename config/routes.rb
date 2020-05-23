Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }

  resources :users, only: [:show, :index]
  root 'welcome#index'
  get 'teams', to: 'teams#index'
  # post 'login', to: 'sessions#create'
end
