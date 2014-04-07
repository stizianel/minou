class ChangeDataTypeForTimedays < ActiveRecord::Migration
  def change
  	change_table :timedays do |t|
  		t.change :hour1, :float
  		t.change :hour2, :float
  		t.change :hour3, :float
  		t.change :hour4, :float
  	end
  end
end
