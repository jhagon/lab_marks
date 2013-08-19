require File.dirname(__FILE__) + '/../spec_helper'

describe Sheet do
  it "should be valid" do
    Sheet.new.should be_valid
  end
end
