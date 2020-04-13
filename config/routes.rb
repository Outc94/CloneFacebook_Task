Rails.application.routes.draw do
  root 'users#new'
  resources :posts do
    collection do
      post :confirm
     end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
end
