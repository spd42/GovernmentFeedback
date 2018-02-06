Rails.application.routes.draw do
  devise_for :users
  resources :departments do
  	resources :reviews
  end
  resources :categories
  root 'departments#home'
end
