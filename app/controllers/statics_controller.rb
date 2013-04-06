class StaticsController < ApplicationController
  
  def show
    @static = Static.where(:paralink => params[:param]).first
    render json: @static
  end
  
end
