class ChangeKmsForTimedays < ActiveRecord::Migration
  def change
  	change_table :timedays do |t|
  		t.change :km1, :float
  		t.change :km2, :float
  		t.change :km3, :float
  		t.change :km4, :float
  	end
  end
end
