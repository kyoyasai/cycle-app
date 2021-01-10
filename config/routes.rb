Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: "guests#new_guest"
  end
  root to: "articles#index"
  resources :articles do
    resources :comments, only: :create
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end
  resources :users, only: :show do
    member do
      get 'search'
    end
  end
end