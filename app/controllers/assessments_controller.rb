class AssessmentsController < ApplicationController
  def index
    @title = "List Assessments"
    @assessments = Assessment.all
  end

  def show
    @title = "Show Assessment"
    @assessment = Assessment.find(params[:id])
  end

  def new
    @title = "New Assessment"
    @assessment = Assessment.new
  end

  def create
    @assessment = Assessment.new(params[:assessment])
    if @assessment.save
      redirect_to @assessment, :notice => "Successfully created assessment."
    else
      render :action => 'new'
    end
  end

  def edit
    @title = "Edit Assessment"
    @assessment = Assessment.find(params[:id])
  end

  def update
    @assessment = Assessment.find(params[:id])
    if @assessment.update_attributes(params[:assessment])
      redirect_to @assessment, :notice  => "Successfully updated assessment."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @assessment = Assessment.find(params[:id])
    @assessment.destroy
    redirect_to assessments_url, :notice => "Successfully destroyed assessment."
  end
end
