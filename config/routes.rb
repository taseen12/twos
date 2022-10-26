Rails.application.routes.draw do
  get 'video/index'
  get 'video_tour/index'
  get 'my_order/index'
  resources :orders
  root to: "store#index"

  resources :products
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
