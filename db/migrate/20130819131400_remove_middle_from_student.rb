class RemoveMiddleFromStudent < ActiveRecord::Migration
  def self.up
    remove_column :students, :middle
  end
  def self.down
    add_column :students, :middle, :string
  end
end
