Rails.application.routes.draw do
  post 'posts/create' => "posts#create"
  post 'posts/new' => "posts#new"
  get 'posts/new' => "posts#new"
  get 'posts/index' => "posts#index"
  get 'posts/:id' => "posts#show"

  get '/' => "home#top"
  get 'about' => "home#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
