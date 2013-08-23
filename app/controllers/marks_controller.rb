class MarksController < ApplicationController
  def index
    @marks = Mark.all
  end

  def show
    @mark = Mark.find(params[:id])
  end

  def new
    @mark = Mark.new
  end

  def create
    @mark = Mark.new(params[:mark])
    if @mark.save
      redirect_to @mark, :notice => "Successfully created mark."
    else
      render :action => 'new'
    end
  end

  def edit
    @mark = Mark.find(params[:id])
  end

  def update
    @mark = Mark.find(params[:id])
    if @mark.update_attributes(params[:mark])
      redirect_to @mark, :notice  => "Successfully updated mark."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @mark = Mark.find(params[:id])
    @mark.destroy
    redirect_to marks_url, :notice => "Successfully destroyed mark."
  end
end
