# == Schema Information
#
# Table name: experiments
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  desc       :text
#  created_at :datetime
#  updated_at :datetime
#

class Experiment < ActiveRecord::Base
  attr_accessible :title, :desc
end
