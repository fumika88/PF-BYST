Rails.application.routes.draw do

  get 'categories/index'
  get 'categories/edit'
  get 'photo_comments/create'
  get 'photo_comments/destroy'
  get 'search/search'
  get '/photo/category/:id', to:"photos#category", as: "photo_category"
  devise_for :users
  root :to => "homes#top"
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in' #ゲストログインroot
  get 'home/about' => 'homes#about'
  get '/photo/hashtag/:name', to: "photos#hashtag"
  get '/photo/ranking', to:"photos#ranking"

  resources :photos, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :photo_comments, only: [:create, :destroy, :index]
  end
  resources :users, only: [:show, :index, :edit, :update, :destroy]
  get '/search', to: 'search#search'
  #get '/photos/category/:id', to: "photos#category"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
