Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines thec root path route ("/")
  # root "articles#index"
  root to: 'lists#index'
  resources :lists, except: :index

  resources :movies do
    resources :bookmarks
  end
end
