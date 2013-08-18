# == Schema Information
#
# Table name: markers
#
#  id         :integer          not null, primary key
#  first      :string(255)
#  last       :string(255)
#  email      :string(255)
#  abbr       :string(255)
#  scaling    :float
#  admin      :boolean
#  created_at :datetime
#  updated_at :datetime
#

class Marker < ActiveRecord::Base

  attr_accessible :first, :last, :email, :abbr, :scaling, :admin

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first, :presence => true
  validates :last, :presence => true
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :abbr, :presence => true
end
