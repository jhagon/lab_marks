class CreateSheets < ActiveRecord::Migration
  def self.up
    create_table :sheets do |t|
      t.integer :student_id
      t.integer :partner_id
      t.integer :experiment_id
      t.integer :marker_id
      t.text :comments
      t.integer :raw_mark
      t.float :ret_mark
      t.timestamps
    end
  end

  def self.down
    drop_table :sheets
  end
end
