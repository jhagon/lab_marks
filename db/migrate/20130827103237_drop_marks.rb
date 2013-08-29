class DropMarks < ActiveRecord::Migration
  def self.up
    drop_table :marks
  end
  def self.down
    create_table :marks do |t|
      t.integer :assessment_id
      t.integer :sheet_id
      t.integer :mark

      t.timestamps
    end
  end
end
