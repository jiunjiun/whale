Rails.application.routes.draw do
  devise_for :users

  namespace :developers, path: '/', constraints: { subdomain: 'developer' } do
    root 'dashboards#index'
    resources :dashboards, only: [:index]
    resources :sharks do
      resources :bots
      resources :photos, only: [:index, :create, :destroy] do
        put :update, on: :collection
      end
    end

    resources :users, only: [] do
      collection do
        get :profiles
        patch :update_profile
        patch :update_password
      end
    end
  end

  namespace :users do
    resources :profiles
  end

  root 'home#index'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
