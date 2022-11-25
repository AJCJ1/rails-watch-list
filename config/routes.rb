Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "lists#index"

  resources :movies, only: %i[index show]

  resources :lists, only: %i[new create index show] do
    resources :bookmarks, only: %i[new create index show delete]
  end

  resources :bookmarks, only: %i[index]
end
