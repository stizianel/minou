class CreateTimecodes < ActiveRecord::Migration
  def change
    create_table :timecodes do |t|
      t.string :descr
      t.string :typo

      t.timestamps
    end
  end
end
