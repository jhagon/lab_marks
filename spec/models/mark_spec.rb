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

require File.dirname(__FILE__) + '/../spec_helper'

describe Mark do
  it "should be valid" do
    Mark.new.should be_valid
  end
end
