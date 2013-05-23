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
  match "/admin/statics" => "users#admin_statics"
  match "/admin/photos" => "users#admin_photos"
  match "/admin/videos" => "users#admin_videos"
  
  # Types
  match "/types/:name/works" => "types#works"
  match "/gallery/works" => "types#gallery"
  
end
