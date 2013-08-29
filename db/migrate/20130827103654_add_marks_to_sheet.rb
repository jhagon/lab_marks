class AddMarksToSheet < ActiveRecord::Migration
  def self.up
    add_column :sheets, :mark1, :integer, :default => nil
    add_column :sheets, :mark2, :integer, :default => nil
    add_column :sheets, :mark3, :integer, :default => nil
    add_column :sheets, :mark4, :integer, :default => nil
  end
  def self.down
    remove_column :sheets, :mark1
    remove_column :sheets, :mark2
    remove_column :sheets, :mark3
    remove_column :sheets, :mark4
  end
end
