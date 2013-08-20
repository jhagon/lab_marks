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

require File.dirname(__FILE__) + '/../spec_helper'

describe Assessment do
  it "should be valid" do
    Assessment.new.should be_valid
  end
end
