Rails.application.routes.draw do
  get 'search/search'
  devise_for :users
  root :to => "homes#top"
  get 'home/about' => 'homes#about'
  get '/photo/hashtag/:name', to: "photos#hashtag"
  resources :photos, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  get '/search', to: 'search#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
