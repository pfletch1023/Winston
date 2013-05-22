class UsersController < ApplicationController
  
  def login
  end
  
  def authenticate  
    user = User.authenticate(params[:email], params[:password])  
    
    if user  
      session[:user_id] = user.id
      redirect_to "/"  
    else
      redirect_to "/login"
    end  
  end
  
  def logout  
    session[:user_id] = nil  
    redirect_to "/"
  end
  
  def admin
    @works = Work.all
    @statics = Static.all
    @types = Type.all
  end
  
end
