class CreateTimedays < ActiveRecord::Migration
  def change
    create_table :timedays do |t|
      t.date :day
      t.integer :code1
      t.integer :hour1
      t.integer :code2
      t.integer :hour2
      t.integer :code3
      t.integer :hour3
      t.integer :timesheet_id
      t.string :note

      t.timestamps
    end
  end
end
