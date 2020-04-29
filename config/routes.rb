Rails.application.routes.draw do
  root 'sureads#index'

  devise_for :users
  
  resources :sureads, only: [:index, :show, :create] do
    collection do
      get 'search', to: 'sureads#search'
    end
    resources :responses, only: [:create]
  end
  
  resources :categories, only: [:show]
end
