class SheetsController < ApplicationController
  def index
    @sheets = Sheet.all
    @title = "List Mark Sheets"
  end

  def show
    @sheet = Sheet.find(params[:id])
    @title = "Show Mark Sheet"
  end

  def new
    @sheet = Sheet.new
    @title = "New Mark Sheet"
  end

  def create
    @sheet = Sheet.new(params[:sheet])
    if @sheet.save
      redirect_to @sheet, :notice => "Successfully created sheet."
    else
      render :action => 'new'
    end
  end

  def edit
    @sheet = Sheet.find(params[:id])
    @title = "Edit Mark Sheet"
  end

  def update
    @sheet = Sheet.find(params[:id])
    if @sheet.update_attributes(params[:sheet])
      redirect_to @sheet, :notice  => "Successfully updated sheet."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @sheet = Sheet.find(params[:id])
    @sheet.destroy
    redirect_to sheets_url, :notice => "Successfully destroyed sheet."
  end
end
