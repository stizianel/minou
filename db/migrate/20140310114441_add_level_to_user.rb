class AddLevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :level, :string
    add_column :users, :intext, :string
  end
end
