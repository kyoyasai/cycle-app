Rails.application.routes.draw do
  devise_for :users
  root to: "articles#index"
  resources :articles, only: [:new, :create, :edit, :update, :destroy, :show]
  resources :users, only: :show
end