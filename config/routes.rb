Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :categories do
    resources :drinks, only: :index
  end

  namespace :admin do
    resources :categories, only: [:edit]
  end

  resources :drinks, only: [:index, :new, :create]
end
