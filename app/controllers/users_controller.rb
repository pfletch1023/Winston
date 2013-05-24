class UsersController < ApplicationController
  
  before_filter :require_login, :except => ["authenticate", "logout", "login"]

  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_user
  end
  
  def login
  end
  
  def authenticate  
    user = User.authenticate(params[:email], params[:password])  
    if user  
      session[:user_id] = user.id
      redirect_to "/admin"  
    else
      redirect_to "/login"
    end  
  end
  
  def logout  
    session[:user_id] = nil  
    redirect_to "/"
  end
  
  def admin
    @type = Type.where(:name => "performance").first
    @works = @type.works
  end
  
  def admin_photos
    @works = Type.where(:name => "photo").first.works
  end
  
  def admin_videos
    @works = Type.where(:name => "video").first.works
  end
  
  def admin_statics
    @statics = Static.all
  end
  
end
