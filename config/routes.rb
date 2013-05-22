Winston::Application.routes.draw do
  
  root :to => "works#index"
  
  # Resources
  resources :types, :works, :statics
  
  # User Authentication
  match "/login" => "users#login"
  match "/authenticate" => "users#authenticate"
  match "/logout" => "users#logout"
  
  # Static
  match "/statics" => "statics#index"
  match "/statics/:param" => "statics#show"

  # Admin Panel
  match "/admin" => "users#admin"
  
end
