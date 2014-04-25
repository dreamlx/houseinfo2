class ChangeRoomNoFormatInRoom < ActiveRecord::Migration
  def up
    rename_column :rooms, :room_no, :room_no_old
    add_column :rooms, :room_no, :integer

    Room.reset_column_information
    Room.find_each { |c| c.update_attribute(:room_no, c.room_no_old) } 
    remove_column :rooms, :room_no_old
  end

end
