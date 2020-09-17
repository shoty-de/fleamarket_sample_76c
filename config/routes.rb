Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'profiles', to: 'users/registrations#new_profile'
    post 'profiles', to: 'users/registrations#create_profile'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    post 'products/new', to: 'products#create'
    get 'products/create', to: 'products#show'
  end
  root 'products#index'
  resources :products, only: [:index, :new, :create, :show, :edit, :destroy] do
    collection do
      get 'get_children_category', defaults: { format: 'json' }
    end
  end
end

