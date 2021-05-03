Rails.application.routes.draw do
  root to:'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
    # 順番上にあげた
  resources :users,only: [:show,:index,:edit,:update] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end

  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end