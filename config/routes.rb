Rails.application.routes.draw do
  root 'battles#new'

  resources :battles, only: [:new, :show, :create, :update] do
    post :count, on: :collection
  end
end
