Rails.application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions"}
  resources :books

  root 'static_pages#home'

end
