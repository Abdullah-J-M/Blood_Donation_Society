Rails.application.routes.draw do
  devise_for :users
  root 'pages#home'

  get 'pages/home'
  get 'pages/about'
  get 'posts/specific_indexing'
  patch 'posts/:id(.:format)', to: 'posts#add_donator', as: 'add_donator'
  resources :posts do
    resources :comments
    resources :volunteers, only: %i[create destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
