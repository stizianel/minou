class AddKmToTimeday < ActiveRecord::Migration
  def change
    add_column :timedays, :km1, :integer
    add_column :timedays, :km2, :integer
    add_column :timedays, :km3, :integer
  end
end
