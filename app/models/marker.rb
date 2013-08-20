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

class Marker < ActiveRecord::Base

  attr_accessor :password  # create virtual attribute 'password'

  attr_accessible :first, :last, :email, :abbr, :scaling, 
                  :admin, :password, :password_confirmation

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first, :presence => true,
                    :length   => { :maximum => 32 }
  validates :last, :presence => true,
                    :length   => { :maximum => 32 }
  validates :email, :presence => true,
                    :format => { :with => email_regex },
                    :uniqueness => { :case_sensitive => false }
  validates :abbr, :presence => true

  # automatically create a virtual attribute 'password_confirmation'

  validates :password, :presence	=> true,
                       :confirmation	=> true,
                       :length		=> { :within => 6..40 }

  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    marker = find_by_email(email)
    return nil if marker.nil?
    return marker if marker.has_password?(submitted_password)
  end

  private

    def encrypt_password

      # need to use 'self' here because we're ASSIGNING an 
      # object attribute - otherwise all that will happen is a
      # local variable called encrypted_password would be created.

      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end
end
