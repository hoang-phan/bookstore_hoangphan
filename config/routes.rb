Rails.application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions"}
  resources :books
  resources :categories

  get "books/search"
  get "categories/search"

  root 'static_pages#home'

end
