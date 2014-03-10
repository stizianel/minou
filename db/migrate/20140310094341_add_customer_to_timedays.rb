class AddCustomerToTimedays < ActiveRecord::Migration
  def change
    add_column :timedays, :cust1, :integer
    add_column :timedays, :cust2, :integer
    add_column :timedays, :cust3, :integer
  end
end
