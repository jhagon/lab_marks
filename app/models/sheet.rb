class Sheet < ActiveRecord::Base
  attr_accessible :student_id, :partner_id, :experiment_id, :marker_id, :comments, :raw_mark, :ret_mark
end
