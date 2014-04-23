class CreateUnitModels < ActiveRecord::Migration
  def change
    create_table :unit_models do |t|
      t.string :title
      t.text :desc

      t.timestamps
    end
  end
end
