Rails.application.routes.draw do
  #products routes
  root to: 'products#home'
  get 'home' => 'products#home'
  
  resources :products do  
    resources :reviews
  end

  #devise routes
  devise_for :users, :path => '', :path_names => { :sign_in => "login", :sign_out => "logout", :sign_up => "register" }
  
end
