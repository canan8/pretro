Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }

  resources :users, only: [:show, :index]

  as :user do
    get 'users/edit', :to => 'devise/registrations#edit', :as => :user_root
  end

  root 'welcome#index'
  get 'teams', to: 'teams#index'
  
end
