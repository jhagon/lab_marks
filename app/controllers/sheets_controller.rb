class SheetsController < ApplicationController

  before_filter :authenticate, :only => [:destroy]
  helper_method :sort_column, :sort_direction

  def index
    @sheets = Sheet.paginate(:page => params[:page]).all( :joins => [:experiment, :student],
                         :order => "#{sort_column} #{sort_direction}")
    @title = "List Mark Sheets"
  end

  def show
    @sheet = Sheet.find(params[:id])
    @returned_mark = (@sheet.total_mark * @sheet.marker.scaling / 20 ) * 100.0
    @returned_mark = @returned_mark.to_int
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

private

  def authenticate
    deny_access unless signed_in? && is_admin?
  end

  def sort_column
    cols = Sheet.column_names + Experiment.column_names + Student.column_names
    cols.include?(params[:sort]) ? params[:sort] : "last"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end
