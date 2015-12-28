Rails.application.routes.draw do
  root 'battles#new'

  resources :users, only: [] do
    resources :battles, only: [:show, :create, :destroy]
  end

  resources :battles, only: [:new, :show, :create, :update] do
    post :count, on: :collection
  end

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'sessions/destroy', to: 'sessions#destroy'
  get 'auth/failure', to: 'battles#new'
end
