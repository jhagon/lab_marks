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

require File.dirname(__FILE__) + '/../spec_helper'

describe Experiment do
  it "should be valid" do
    Experiment.new.should be_valid
  end
end
