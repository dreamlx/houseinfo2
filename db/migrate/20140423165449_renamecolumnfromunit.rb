class Renamecolumnfromunit < ActiveRecord::Migration
  def change
    rename_table :unit_models, :room_models
    remove_column :units, :room_no
    remove_column :units, :area
    remove_column :units, :builder_id
    add_column :units, :title, :string
    add_column :units, :desc, :string
  end
end
