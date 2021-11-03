Rails.application.routes.draw do
  devise_for :users
  resources :books, only: :show
  root 'books#index'

  namespace :admin do
    resources :books
    resources :categories
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
