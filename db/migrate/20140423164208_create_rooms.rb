class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :room_no
      t.integer :area
      t.integer :room_model_id
      t.integer :unit_id
      t.integer :building_id

      t.timestamps
    end
  end
end
