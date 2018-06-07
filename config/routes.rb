Rails.application.routes.draw do
  root 'tweets#index'
  devise_for :users

  resources :tweets, only: [:index, :show, :create, :destroy, :update ] do
    resources :comments, only: :create
  end
  put "/tweets/:id/downvote", to: "tweets#downvote", as: "downvote"
end
