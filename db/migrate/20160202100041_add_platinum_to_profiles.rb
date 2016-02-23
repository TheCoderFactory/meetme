class AddPlatinumToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :platinum, :boolean, default: false
  end
end
