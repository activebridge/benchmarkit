Rails.application.routes.draw do
  root 'battles#new'

  resource :battles, only: [:new, :create, :show] do
    post :count
  end
end
