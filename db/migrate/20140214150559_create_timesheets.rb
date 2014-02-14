class CreateTimesheets < ActiveRecord::Migration
  def change
    create_table :timesheets do |t|
      t.integer :year
      t.integer :month
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
