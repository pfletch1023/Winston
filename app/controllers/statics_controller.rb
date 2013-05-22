class StaticsController < ApplicationController
  
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
  
end
