require File.dirname(__FILE__) + '/../spec_helper'

describe Assessment do
  it "should be valid" do
    Assessment.new.should be_valid
  end
end
