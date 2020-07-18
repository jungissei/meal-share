Rails.application.routes.draw do
  resources :post_cats
  resources :cats

  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  devise_for :users
  resources :users, only: [:show] do
    resources :relationships, only: [:create, :destroy]
  end

  resources :notifications, only: :index

  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
