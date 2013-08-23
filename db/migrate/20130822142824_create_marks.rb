class CreateMarks < ActiveRecord::Migration
  def self.up
    create_table :marks do |t|
      t.integer :score
      t.integer :assessment_id
      t.integer :sheet_id
      t.timestamps
    end
  end

  def self.down
    drop_table :marks
  end
end
