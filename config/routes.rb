Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す
  get 'users/:id/follow' => 'users#follow', as: 'follows'
  get 'users/:id/follower' => 'users#follower', as: 'followers'
  resources :users, only: [:show, :index, :edit, :update]
  resources :books, except: [:new] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
