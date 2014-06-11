Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :line_items

  resources :carts

  devise_for :users, :controllers => {:sessions => "sessions"}
  resources :books
  resources :categories
  # resources :sessions, only: :change_per_page

  get "books/search"
  get "categories/search"
  post "books/rating"
  post "books/change_per_page"

  root 'static_pages#home'

end
