Rails.application.routes.draw do
  resources :class_statuses
  resources :class_lists
  resources :products do
  # resources :articles do
	resources :reviews, only: [:create]
  end
  # resources :comments
  # resources :articles
  devise_for :users
  resources :tests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'tests#index'
  # root 'products#index'
  root 'class_lists#index'
	
end
