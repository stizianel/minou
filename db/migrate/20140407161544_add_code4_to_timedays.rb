class AddCode4ToTimedays < ActiveRecord::Migration
  def change
    add_column :timedays, :code4, :integer
    add_column :timedays, :hour4, :integer
    add_column :timedays, :cust4, :integer
    add_column :timedays, :km4, :integer
  end
end
