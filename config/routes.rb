Winston::Application.routes.draw do
  
  root :to => "works#index"
  
  # User Authentication
  match "/login" => "users#login"
  match "/authenticate" => "users#authenticate"
  match "/logout" => "users#logout"
  
  #Static
  match "/statics/:param" => "statics#show"
  
end
