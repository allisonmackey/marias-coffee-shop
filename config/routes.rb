Rails.application.routes.draw do
  root to: 'products#index'
  resources :products do  
    resources :reviews
  end
  get 'landing_page' => "custom_controller#landing_page"
end
