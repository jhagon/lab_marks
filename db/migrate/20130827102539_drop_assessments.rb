class DropAssessments < ActiveRecord::Migration
  def self.up
    drop_table :assessments
  end
  def self.down
    create_table :assessments do |t|
      t.string  :name
      t.integer :value
      t.text    :desc

      t.timestamps
    end
  end
end
