Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :polls, only: [:index, :show] do
    resources :votes, only: [:create, :update, :destroy]
  end

  resources :polls, path: 'my_polls', controller: 'user_polls', only: [:index, :show, :create, :update, :destroy] do
    resources :votes, only: [:create, :update, :destroy]
  end

  post 'login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  root 'polls#index'
end
