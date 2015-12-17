Rails.application.routes.draw do
  root 'battles#new'

  resources :battles, only: [:new, :create, :show] do
    post :count
  end
end
