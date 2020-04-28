Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users
  
  resources :sureads, only: [:index, :create]
  resources :categories, only: [:show]
end
