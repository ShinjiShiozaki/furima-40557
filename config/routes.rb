Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show, :edit]
 
  #resources :items
  #resources :prototypes, only: [:index, :new, :create, :show]
  
  #resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy] do
  #  resources :comments, only: :create 
  #end
  #resources :users, only: :show

end
