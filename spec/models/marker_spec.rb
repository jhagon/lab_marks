# == Schema Information
#
# Table name: markers
#
#  id                 :integer          not null, primary key
#  first              :string(255)
#  last               :string(255)
#  email              :string(255)
#  abbr               :string(255)
#  scaling            :float
#  admin              :boolean
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

require 'spec_helper'

describe Marker do
  pending "add some examples to (or delete) #{__FILE__}"
end
