class Student < ActiveRecord::Base
  attr_accessible :number, :first, :middle, :last, :email
end
