Rails.application.routes.draw do
  root 'users#index'
  resources :users, path: '/users' do
    resources :posts, path: '/posts' do
      resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end
