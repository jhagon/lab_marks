# == Schema Information
#
# Table name: assessments
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  value      :integer
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#

class Assessment < ActiveRecord::Base
  attr_accessible :name, :value, :desc
end
