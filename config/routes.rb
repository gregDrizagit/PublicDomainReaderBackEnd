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

      resources :bookmarks

      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      post '/search', to: 'books#search'
      post '/get_book', to: 'request#get_book'
      post '/new', to: 'collections#new'
      post '/load_bookmark', to: 'bookmarks#load_bookmark'

      get '/currently_reading', to: "users#currently_reading"

      post '/book_list', to: "books#list"
      post '/subject_list', to: "subjects#list"
      post '/author_list', to: "authors#list"
      post '/bookshelf_list', to: "bookshelves#list"

      get '/test', to: 'users#test'
      get '/seed', to: "request#fetch_data"
    end
  end
end
