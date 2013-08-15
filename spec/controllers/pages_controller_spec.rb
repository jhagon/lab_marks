require 'spec_helper'

describe PagesController do

  # Actually render the pages as well.
  # This ensures that if the test passes, the page is really there.
  # Also, need this for testing HTML of rendered pages.
  render_views

  describe "GET 'home'" do
    it "returns http success" do
      get 'home'
      response.should be_success
    end
    it "should have the right title" do
      get 'home'
      response.should have_selector("title",
               :content => "Lab Mark Database|Home")
    end
  end

  describe "GET 'contact'" do
    it "returns http success" do
      get 'contact'
      response.should be_success
    end
    it "should have the right title" do
      get 'contact'
      response.should have_selector("title",
               :content => "Lab Mark Database|Contact")
    end
  end

  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
    it "should have the right title" do
      get 'about'
      response.should have_selector("title",
               :content => "Lab Mark Database|About")
    end
  end

end
