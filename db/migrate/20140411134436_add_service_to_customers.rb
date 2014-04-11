class AddServiceToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :service, :string
  end
end
