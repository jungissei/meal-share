Rails.application.routes.draw do
  resources :post_cats
  resources :cats
  resources :posts
  devise_for :users
  root to: 'home#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
