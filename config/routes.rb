Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: :registrations, sessions: :sessions}
  root 'users#index'
  resources :users, path: '/users' do
    resources :posts, path: '/posts' do
      resources :comments, only: [:create, :destroy]
      resources :likes, only: [:create]
    end
  end
end
