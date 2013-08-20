class MarkersController < ApplicationController

  def index
    @title = "List Markers"
    @markers = Marker.all
  end


  def show
    @title = "Show Marker"
    @marker = Marker.find(params[:id])
  end

  def new
    @title = "New Marker"
  end
end
