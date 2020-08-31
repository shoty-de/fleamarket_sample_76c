Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products, only: [:new, :create] do
    collection do
      get 'get_children_category', defaults: { format: 'json' }
    end
  end
end