class WorksController < ApplicationController
  
  before_filter :require_login, :only => ["edit", "new", "create"]

  def require_login
    unless logged_in?
      redirect_to '/login' # halts request cycle
    end
  end
 
  def logged_in?
    !!current_user
  end
  
  def index
  end
  
  def edit
    @work = Work.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @work }
    end
  end
  
  def update
    @work = Work.find(params[:id])
    respond_to do |format|
      if @work.update_attributes(params[:work])
        format.html { redirect_to "/admin" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def new
    @work = Work.new
    @type_id = Type.where(:name => "performance").first
    @type_id = @type_id.id if @type_id
  end
  
  def new_photo
    @work = Work.new
    @type_id = Type.where(:name => "photo").first
    @type_id = @type_id.id if @type_id
  end
  
  def new_video
    @work = Work.new
    @type_id = Type.where(:name => "video").first
    @type_id = @type_id.id if @type_id
  end
  
  def create
    @work = Work.new(params[:work])
    if @work.save
      redirect_to "/admin"
    else
      render "new"
    end
  end
  
  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to "/admin"
  end
  
end
