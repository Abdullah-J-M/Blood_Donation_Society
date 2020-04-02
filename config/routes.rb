Rails.application.routes.draw do
  devise_for :users, path_prefix: 'my'
  patch 'users/:id(.:format)', to: 'users#update_donated_date_post_donator', as: 'select_volunteer'
  root 'pages#home'

  get 'pages/home'
  get 'pages/about'
  get 'posts/specific_indexing'
  resources :posts do
    resources :comments
    resources :volunteers, only: %i[create destroy]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
