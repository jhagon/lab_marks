class AddmarkerEmailUniqenessIndex < ActiveRecord::Migration
  def self.up
    add_index :markers, :email, :unique => true
  end

  def self.down
    remove_index :markers, :email
  end
end
