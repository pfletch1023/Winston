class WorksController < ApplicationController
  
  def index
    @works = Work.all
  end
  
  def edit
    @work = Work.find(params[:id])
  end
  
end
