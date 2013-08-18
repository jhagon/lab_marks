class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :first
      t.string :last
      t.string :email
      t.string :abbr
      t.float :scaling
      t.boolean :admin

      t.timestamps
    end
  end
end
