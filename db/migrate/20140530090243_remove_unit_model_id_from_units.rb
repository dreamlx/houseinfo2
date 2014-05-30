class RemoveUnitModelIdFromUnits < ActiveRecord::Migration
  def up
    remove_column :units, :unit_model_id
  end

  def down
    add_column :units, :unit_model_id, :string
  end
end
