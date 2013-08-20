class AddSaltToMarkers < ActiveRecord::Migration
  def self.up
    add_column :markers, :salt, :string
  end
  def self.down
    remove_column :markers, :salt
  end
end
