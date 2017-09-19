Rails.application.routes.draw do
  post 'posts/create' => "posts#create"
  post 'posts/new' => "posts#new"
  post 'posts/:id/update' => "posts#update"
  post 'posts/:id/destroy' => "posts#destroy"
  get 'posts/new' => "posts#new"
  get 'posts/index' => "posts#index"
  get 'posts/:id' => "posts#show"
  get 'posts/:id/edit' => "posts#edit"


  get '/' => "home#top"
  get 'about' => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
