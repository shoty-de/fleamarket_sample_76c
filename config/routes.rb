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

  resources :products, only: [:index, :new, :create, :show, :edit, :destroy, :update] do
    collection do
      get 'get_children_category', defaults: { format: 'json' }
    end
  end

  resources :creditcards, only: [:index, :new] do
    collection do
      post 'pay', to: 'creditcards#pay'
      post 'delete', to: 'creditcards#delete'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  resources :users, only: :show do
    collection do
      get "sell_products"
      get "buy_products"
      get "show_profile"
      get "show_address"
      get "show_userdata"
    end
  end
end
