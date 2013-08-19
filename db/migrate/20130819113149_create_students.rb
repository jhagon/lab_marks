class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :number
      t.string :first
      t.string :middle
      t.string :last
      t.string :email
      t.timestamps
    end
  end

  def self.down
    drop_table :students
  end
end
