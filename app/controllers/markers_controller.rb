class MarkersController < ApplicationController

  def show
    @marker = Marker.find(params[:id])
  end

  def new
    @title = "Create New Marker"
  end
end
