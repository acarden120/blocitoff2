Rails.application.routes.draw do
  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"

  get "sign_up" => 'users#new', :as => 'sign_up'

  resources :todos, only: [:new, :create, :show]
  resources :users
  resources :sessions

#  root 'todos#new'
  root :to => "users#new"
end
