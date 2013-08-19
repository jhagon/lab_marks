class ExperimentsController < ApplicationController
  def index
    @experiments = Experiment.all
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(params[:experiment])
    if @experiment.save
      redirect_to @experiment, :notice => "Successfully created experiment."
    else
      render :action => 'new'
    end
  end

  def edit
    @experiment = Experiment.find(params[:id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    if @experiment.update_attributes(params[:experiment])
      redirect_to @experiment, :notice  => "Successfully updated experiment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy
    redirect_to experiments_url, :notice => "Successfully destroyed experiment."
  end
end
