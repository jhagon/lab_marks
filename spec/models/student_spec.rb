# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  number     :string(255)
#  first      :string(255)
#  last       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require File.dirname(__FILE__) + '/../spec_helper'

describe Student do
  it "should be valid" do
    Student.new.should be_valid
  end
end
