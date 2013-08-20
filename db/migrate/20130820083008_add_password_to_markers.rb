class AddPasswordToMarkers < ActiveRecord::Migration
  def self.up
    add_column :markers, :encrypted_password, :string
  end
  def self.down
    remove_column :markers, :encrypted_password
  end
end
