class TypesController < ApplicationController
  
  before_filter :require_login, :only => ["edit", "update"]

  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_user
  end
  
  def index
    @types = Type.all
  end
  
  def edit
    @type = Type.find(params[:id])
  end
  
  def works
    @type = Type.where(:name => params[:name]).first
    @works = @type.works
    render json: @works.as_json
  end
  
  def gallery
    @works = Type.where(:name => "video").first.works + Type.where(:name => "photo").first.works
    render json: @works.as_json
  end
  
end
