Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  post "books/change_per_page"
  patch "orders/paypal"
  get "orders/success_paypal"
  get "orders/success"
  get "orders/failure"

  devise_for :users, :controllers => { sessions: "sessions", registrations: "registrations", omniauth_callbacks: "users/omniauth_callbacks" }
  resources :books
  resources :orders
  resources :order_lines
  resources :categories
  resources :comments
  resources :search, only: :index
  resources :charges

  root 'static_pages#home'

end

