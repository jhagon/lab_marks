# == Schema Information
#
# Table name: sheets
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  partner_id    :integer
#  experiment_id :integer
#  marker_id     :integer
#  comments      :text
#  raw_mark      :integer
#  ret_mark      :float
#  created_at    :datetime
#  updated_at    :datetime
#

class Sheet < ActiveRecord::Base
  attr_accessible :student_id, :partner_id, :experiment_id, :marker_id, :comments, :raw_mark, :ret_mark

  belongs_to :student
  belongs_to :partner, :class_name => "Student", :foreign_key => "student_id"
  belongs_to :experiment
  belongs_to :marker

  has_many :marks
  has_many :assessments, through: :marks

end
