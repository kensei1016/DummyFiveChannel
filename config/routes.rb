Rails.application.routes.draw do
  get 'categories/show'
  get 'sureads/index'
  get 'sureads/create'
  get 'homes/top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
