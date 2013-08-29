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
#  mark1         :integer
#  mark2         :integer
#  mark3         :integer
#  mark4         :integer
#

require File.dirname(__FILE__) + '/../spec_helper'

describe Sheet do
  it "should be valid" do
    Sheet.new.should be_valid
  end
end
