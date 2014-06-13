Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => {:sessions => "sessions"}
  resources :books
  resources :orders
  resources :order_lines
  resources :categories
  resources :search, only: :index

  post "books/rating"
  post "books/change_per_page"

  root 'static_pages#home'

end
