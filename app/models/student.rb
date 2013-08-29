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

class Student < ActiveRecord::Base
  attr_accessible :number, :first, :middle, :last, :email

  has_many :sheets
  has_many :sheets, :class_name => 'Sheet', :foreign_key => 'partner_id'

  def name    
    self.last + ',  ' + self.first  
  end
end
