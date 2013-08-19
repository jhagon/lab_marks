class MarkersController < ApplicationController

  def show
    @title = "Show Marker"
    @marker = Marker.find(params[:id])
  end

  def new
    @title = "New Marker"
  end
end
