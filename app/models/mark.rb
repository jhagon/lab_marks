# == Schema Information
#
# Table name: marks
#
#  id            :integer          not null, primary key
#  score         :integer
#  assessment_id :integer
#  sheet_id      :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Mark < ActiveRecord::Base
  attr_accessible :score, :assessment_id, :sheet_id
  
  belongs_to :sheet
  belongs_to :assessment
end
