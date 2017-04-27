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
  get 'users/sign_out', to: redirect('/')

  namespace :consoles, path: '/', constraints: { subdomain: 'console' } do
    root 'dashboards#index'
    resources :dashboards, only: [:index]
    resources :sharks do
      resources :bots, except: [:index, :show]
      resources :photos, only: [:index, :create, :destroy] do
        put :update, on: :collection
      end
    end

    resources :users, only: [] do
      collection do
        get :profiles
        patch :update_profile
        patch :update_donate
        patch :update_password
      end
    end
  end

  namespace :users do
    resources :profiles
  end

  resources :sharks, only: [:show] do
    get :donate
  end
  resources :developers, only: [:show]
  resources :cetaceas, only: [:show]

  get :search, to: 'search#index', as: :search

  root 'home#index'
end
