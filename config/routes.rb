Rails.application.routes.draw do
  get 'sureads/index'
  get 'sureads/show'
  get 'sureads/create'
  get 'sureads/show'
  root 'sureads#index'

  devise_for :users
  
  resources :sureads, only: [:index, :show, :create] do
    collection do
      get 'search', to: 'sureads#search'
    end
  end
  resources :categories, only: [:show]
end
