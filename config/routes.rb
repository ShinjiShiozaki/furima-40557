Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items do
    resources :orders, only: :index 
  end
  
  #商品の購入画面へのルーティング
  #resources :orders, only: [:index]


  #resources :prototypes, only: [:index, :new, :create, :show]
  #resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
  #  resources :comments, only: :create 
  #end
  #resources :users, only: :show
end
