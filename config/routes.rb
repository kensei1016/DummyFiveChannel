Rails.application.routes.draw do
  root 'homes#top'

  devise_for :users
  
  resources :sureads, only: [:index, :create] do
    collection do
      get 'search', to: 'sureads#search'
    end
  end
  resources :categories, only: [:show]
end
