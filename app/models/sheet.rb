# == Schema Information
#
# Table name: sheets
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  partner_id    :integer
#  experiment_id :integer
#  marker_id     :integer
#  comments      :text
#  raw_mark      :integer
#  ret_mark      :float
#  created_at    :datetime
#  updated_at    :datetime
#  mark1         :integer
#  mark2         :integer
#  mark3         :integer
#  mark4         :integer
#

class Sheet < ActiveRecord::Base
  attr_accessible :student_id, :partner_id, :experiment_id, :marker_id, :comments, :mark1, :mark2, :mark3, :mark4, :raw_mark, :ret_mark

  attr_reader :total_mark

  belongs_to :student
  belongs_to :partner, :class_name => "Student", :foreign_key => "partner_id"
  belongs_to :experiment
  belongs_to :marker

  validates :mark1, numericality: {less_than_or_equal_to: 5}
  validates :mark1, numericality: {greater_than_or_equal_to: 0}
  validates :mark1, numericality: {only_integer: true}
  validates :mark2, numericality: {less_than_or_equal_to: 5},
                    numericality: {greater_than_or_equal_to: 0},
                    numericality: {only_integer: true}
  validates :mark3, numericality: {less_than_or_equal_to: 5},
                    numericality: {greater_than_or_equal_to: 0},
                    numericality: {only_integer: true}
  validates :mark4, numericality: {less_than_or_equal_to: 5},
                    numericality: {greater_than_or_equal_to: 0},
                    numericality: {only_integer: true}
  validate :student_must_be_different_from_partner

  def student_must_be_different_from_partner    
    unless ( student_id != partner_id )
      errors.add(:base, "student and partner must be different!")
    end
  end

  def total_mark
    mark1 + mark2 + mark3 + mark4
  end

  def return_mark
    (mark1 + mark2 + mark3 + mark4) * marker.scaling / 20
  end

end
