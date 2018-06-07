Rails.application.routes.draw do
  devise_for :users
  get 'foos/index'
  get 'foos/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
