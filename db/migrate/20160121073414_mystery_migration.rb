class MysteryMigration < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	remove_column :profiles, :first_name, :string
  	remove_column :profiles, :last_name, :string
  end
end
