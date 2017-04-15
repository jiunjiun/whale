Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions',  passwords: 'users/passwords' }, skip: :registrations
  devise_scope :user do
    resource :registration,
      only: [:new, :create],
      controller: 'users/registrations',
      path: 'users',
      path_names: { new: 'sign_up' },
      as: :user_registration
  end

  namespace :consoles, path: '/', constraints: { subdomain: 'console' } do
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

  resources :sharks, only: [:index, :show]

  root 'home#index'
end
