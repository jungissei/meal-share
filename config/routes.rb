Rails.application.routes.draw do
  resources :post_cats
  resources :cats

  resources :posts do
    resources :likes, only: [:create, :destroy]

    collection do
      get 'ranking'
      get 'search'
    end

    resources :comments, only: [:create, :destroy]
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  resources :users, only: [:show] do
    resources :relationships, only: [:create, :destroy]
    resources :followings, only: [:index]
    resources :followers, only: [:index]
    resources :privates, only: [:index]
    resources :likes, only: [:index]
  end

  resources :notifications, only: :index

  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
