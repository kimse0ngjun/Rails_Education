Rails.application.routes.draw do
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
  root 'products#index'
	
end
