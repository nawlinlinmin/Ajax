Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  resources :blogs do
    resources :comments
  end
  resources :conversations do
    resources :messages
  end

  resources :users, only: [:new, :create, :show, :index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
