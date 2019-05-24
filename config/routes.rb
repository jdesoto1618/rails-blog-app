Rails.application.routes.draw do
  devise_for :users
  # /about will show in url, maps to pages controller, about method
  get 'about' => 'pages#about', as: 'about'
  # setting the posts as a resource enables crud routes for the posts controller
  resources :posts do
    # nest the comments to a post inside the post resources routes
    resources :comments
  end
  # route to landing page where all posts will be
  root 'posts#index', as: 'home'
end
