class ChangeRoomNoFormatInRoom < ActiveRecord::Migration
  def up
    change_column :rooms, :room_no, :integer, 'integer USING CAST(room_no AS integer)'
  end

  def down
    change_column :rooms, :room_no, :string
  end
end
