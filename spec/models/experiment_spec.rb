require File.dirname(__FILE__) + '/../spec_helper'

describe Experiment do
  it "should be valid" do
    Experiment.new.should be_valid
  end
end
