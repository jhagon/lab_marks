class PagesController < ApplicationController

  before_filter :authenticate, :only => [:statistics, :marklist]

  def home
    @title="Home"
  end

  def contact
    @title="Contact"
  end

  def about
    @title="About"
  end

  def help
    @title="Help"
  end

  def statistics
    @title="Statistics"
    @sheets = Sheet.all
    @experiments = Experiment.all
    @markers = Marker.all
    @average = overall_average
  end

  def upload
    @title="Upload Data"
  end

  def marklist

    @students = Student.paginate(:page => params[:page]).per_page(12).all(
                         :order => "last ASC")
    @experiments = Experiment.all(
                         :order => "title ASC")

    respond_to do |format|
      format.html
      format.xls
    end
  end
end

  def overall_average
    sum = 0.0
    n_sheets = Sheet.all.count
    for sheet in Sheet.all
      mark1 = sheet.mark1
      mark2 = sheet.mark2
      mark3 = sheet.mark3
      mark4 = sheet.mark4
      scale = sheet.marker.scaling
      sum = sum + scale * (mark1 + mark2 + mark3 +mark4)
    end
    if n_sheets == 0
     overall_average = nil
    else
     overall_average = sum/n_sheets
    end
  end

  def marker_average(marker_id)
    marker_sheets = Sheet.where("marker_id = #{marker_id}")
    sum1 = marker_sheets.sum("mark1")
    sum2 = marker_sheets.sum("mark2")
    sum3 = marker_sheets.sum("mark3")
    sum4 = marker_sheets.sum("mark4")
    n_sheets = marker_sheets.count
    if (n_sheets == 0)
      marker_average = nil
    else
      scale = Marker.find(marker_id).scaling
      marker_average = scale*(sum1+sum2+sum3+sum4)/n_sheets
    end
  end

  def marker_experiment_average(marker_id, experiment_id)
    sheets = Sheet.where(
     "marker_id = #{marker_id} AND experiment_id = #{experiment_id}")
    sum1 = sheets.sum("mark1")
    sum2 = sheets.sum("mark2")
    sum3 = sheets.sum("mark3")
    sum4 = sheets.sum("mark4")
    n_sheets = sheets.count
    if (n_sheets == 0)
      marker_experiment_average = nil
    else
      scale = Marker.find(marker_id).scaling
      marker_experiment_average = scale*(sum1+sum2+sum3+sum4)/n_sheets
    end
  end

  def experiment_average(experiment_id)
    sum = 0.0
    n_markers = 0 # markers who have actually marked
    for marker in Marker.all
      unless marker_experiment_average(marker.id, experiment_id).nil?
        n_markers = n_markers + 1
        sum = sum + marker_experiment_average(marker.id, experiment_id)
      end
    end
    if (n_markers == 0) 
      experiment_average = nil
    else
      experiment_average = sum/n_markers
    end
  end

  def student_experiment_mark(student_id,experiment_id)
    sheet = Sheet.where(
     "student_id = #{student_id} AND experiment_id = #{experiment_id}")
    if sheet.empty?
      return ""
    else
      student_experiment_mark = 
      (sheet.total_mark*1.0*sheet.marker.scaling*100/(MARK_UNIT*4))
    end
  end

private

  def authenticate
    deny_access unless signed_in? && is_admin?
  end

