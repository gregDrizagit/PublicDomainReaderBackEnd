Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
  resources :authors
  resources :books
  resources :bookshelves
  resources :collections
  resources :subject

  get '/', to: "api/v1/request#fetch_data"
end
