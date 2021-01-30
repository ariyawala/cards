Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  resources :lists, only: [:new, :create]
end
