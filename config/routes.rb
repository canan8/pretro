Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }

  resources :users, only: [:show, :index]
  resources :teams
  delete '/teams/remove_user/:id(.:format)', to: 'teams#remove_user_from_team' #??????
end
