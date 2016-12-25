Rails.application.routes.draw do

resources :welcome, only: [:index]

resources :users, only: [:new, :create, :edit, :update, :destroy]
resources :statuses
resources :likes, only: [:create, :destroy]
resources :sessions

root "welcome#index"
delete "sessions/destroy" => "sessions#destroy", as: "signout"
post "/sessions/new" => "sessions#create"
end
