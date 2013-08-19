class CreateExperiments < ActiveRecord::Migration
  def self.up
    create_table :experiments do |t|
      t.string :title
      t.text :desc
      t.timestamps
    end
  end

  def self.down
    drop_table :experiments
  end
end
