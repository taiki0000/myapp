Rails.application.routes.draw do

  post 'posts/create' => "posts#create"
  post 'posts/new' => "posts#new"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/destroy' => "posts#destroy"
  post 'users/create' => "users#create"
  post 'users/:id/update' => "users#update"
  post 'users/:id/destroy' => "users#destroy"
  post 'login' => "users#login"

  get 'posts/new' => "posts#new"
  get 'posts/index' => "posts#index"
  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => "posts#edit"
  get 'users/:id/edit' => "users#edit"
  get 'users/index' => "users#index"
  get 'users/signup' => "users#new"
  get 'users/:id' => "users#show"
  get 'login' => "users#login_form"
  get '/' => "home#top"
  get 'about' => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
