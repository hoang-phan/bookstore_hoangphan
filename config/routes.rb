Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :line_items



  devise_for :users, :controllers => {:sessions => "sessions"}
  resources :books
  resources :carts
  resources :categories
  resources :search, only: :index

  post "books/rating"
  post "books/change_per_page"

  root 'static_pages#home'

end
