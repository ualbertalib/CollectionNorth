CollectionNorth::Engine.routes.draw do
  resources :collections, only: [:show, :index, :create, :new, :edit, :update]
  resources :communities, only: [:show, :index, :create, :new, :edit, :update]
end
