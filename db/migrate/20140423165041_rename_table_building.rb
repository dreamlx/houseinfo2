class RenameTableBuilding < ActiveRecord::Migration
  def change
    rename_table :builders, :buildings
  end
end
