Rails.application.routes.draw do
  get 'lessons/categories'
  get 'lessons/words'
  get 'sessions/new'
  root  'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  resources :users

  namespace :admin do
    resources :categories, :words, :lessons, :users
  end
end