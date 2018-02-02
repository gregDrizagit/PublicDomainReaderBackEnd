Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :users
      resources :authors
      resources :books
      resources :bookshelves
      resources :collections
      resources :subjects

      get '/seed', to: "request#fetch_data"
    end
  end
end
