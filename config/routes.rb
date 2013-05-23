Winston::Application.routes.draw do
  
  root :to => "works#index"
  
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
  match "/works/new_photo" => "works#new_photo"
  match "/works/new_video" => "works#new_video"
  
  # Types
  match "/types/:name/works" => "types#works"
  match "/gallery/works" => "types#gallery"
  
  # Resources
  resources :types, :works, :statics
  
end
