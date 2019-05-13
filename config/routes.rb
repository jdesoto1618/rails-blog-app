Rails.application.routes.draw do
  get 'about' => 'pages#about'
  root 'posts#index'
end
