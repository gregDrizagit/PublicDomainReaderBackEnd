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

      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      post '/search', to: 'books#search'
      post '/get_book', to: 'request#get_book'
      # get '/seed', to: "request#fetch_data"
    end
  end
end
