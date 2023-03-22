Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :users do
    resources :my_pages, only:[:index, :new, :create]
  end
  resources :items do
    resources :orders, only:[:index, :create]
  end

end
