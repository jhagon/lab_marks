class MarkersController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update, :new, :destroy, :index]
  before_filter :correct_marker, :only => [:show]

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
    @marker = Marker.new
  end

  def create
    @marker = Marker.new(params[:marker])
    if @marker.save
      # handle a successful save 
      redirect_to @marker, :notice => "Successfully created marker."
    else
      @title = "New Marker"
      render 'new'
    end
  end

  def edit
    @title = "Edit Marker"
    @marker = Marker.find(params[:id])
  end

  def update
    @marker = Marker.find(params[:id])
    if @marker.update_attributes(params[:marker])
      redirect_to @marker, :notice  => "Successfully updated marker."
    else
      render :action => 'edit'
    end
  end


  def destroy
    @marker = Marker.find(params[:id])
    @marker.destroy
    redirect_to markers_url, :notice => "Successfully destroyed marker."
  end

private

  def authenticate
    deny_access unless signed_in? && is_admin?
  end

  def correct_marker
    @marker = Marker.find(params[:id])
    redirect_to(root_path) unless ( current_marker?(@marker) || is_admin? )
  end
end
