class CreateAssessments < ActiveRecord::Migration
  def self.up
    create_table :assessments do |t|
      t.string :name
      t.integer :value
      t.text :desc
      t.timestamps
    end
  end

  def self.down
    drop_table :assessments
  end
end
