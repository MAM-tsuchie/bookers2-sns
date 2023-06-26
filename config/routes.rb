Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  get "search" => "searches#search"
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy] do
      get :toggle, on: :member
    end
  end

  resources :users, only: [:index,:show,:edit,:update] do
    get :follows, on: :member
    get :followers, on: :member
    resource :relationship, only: [:create, :destroy]
    resources :direct_messages, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
