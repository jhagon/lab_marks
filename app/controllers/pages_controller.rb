class PagesController < ApplicationController
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
    overall_average = sum/n_sheets
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
    experiment_average = sum/n_markers
  end
