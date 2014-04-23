class CreateUnits < ActiveRecord::Migration
  def change
    create_table :units do |t|
      t.integer :builder_id
      t.integer :unit_model_id
      t.string :room_no
      t.float :area

      t.timestamps
    end
  end
end
