Rails.application.routes.draw do
  get 'tags/show'

  root 'links#index'
  resources :links do
    member do
      put :upvote
    end
  end
  resources :users

  resources :sessions, only: [:new, :create, :destroy]

  resources :topics, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
