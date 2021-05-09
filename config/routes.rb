Rails.application.routes.draw do
  devise_for :users
  root :to => "homes#top"
  get '/photo/hashtag/:name', to: "photos#hashtag"
  resources :photos, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
