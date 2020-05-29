Rails.application.routes.draw do
  root to: 'products#index'
  get 'home' => 'products#home'
  
  resources :products do  
    resources :reviews
  end
  
end
