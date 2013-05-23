class StaticsController < ApplicationController
  
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
    @statics = Static.all
    render json: @statics
  end
  
  def show
    @static = Static.where(:paralink => params[:param]).first
    render json: @static
  end
  
  def edit
    @static = Static.find(params[:id])
  end
  
  def update
    @static = Static.find(params[:id])
    respond_to do |format|
      if @static.update_attributes(params[:static])
        format.html { redirect_to "/admin" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @static.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
