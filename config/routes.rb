Rails.application.routes.draw do
  #products routes
  root to: 'products#home'
  get 'home' => 'products#home'
  
  resources :products do  
    resources :reviews
  end

  #devise routes
  devise_for :users, controllers: { 
    sessions: 'devise/sessions',
    registrations: 'devise/registrations',
    # confirmations: 'users/confirmations',
    # omniauthcallbacks: 'users/omniauthcallbacks',
    # passwords: 'users/passwords',
    # unlocks: 'users/unlocks'
  }

  # devise_for :users, :path => '', :path_names => { 
  #   :sign_in => "login", 
  #   :sign_out => "logout", 
  #   :sign_up => "register" 
  # }
end
