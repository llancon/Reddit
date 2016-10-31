Rails.application.routes.draw do
  root 'links#index'
  resources :links do
    member do
      put :upvote
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
