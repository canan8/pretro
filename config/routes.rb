Rails.application.routes.draw do
  root 'welcome#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }

  resources :users, only: %i[show index]
  resources :teams do
    member do
      delete 'remove_user/:user_id', to: 'teams#remove_user_from_team', as: 'remove_user'
      post 'add_user', to: 'teams#add_user', as: 'add_user'
    end
  end
  resources :retros, param: :retro_id do
    member do
      resources :answers, param: :answer_id
    end
  end
end
