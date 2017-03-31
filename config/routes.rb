Rails.application.routes.draw do
  devise_for :users

  namespace :developers do
    root 'dashboards#index'
    resources :dashboards, only: [:index]
    resources :sharks
  end

  namespace :users do
    resources :profiles
  end

  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
