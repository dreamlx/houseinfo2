class ChangeAreaFormateInRoom < ActiveRecord::Migration
  def up
    rename_column :rooms, :area, :area_old
    add_column :rooms, :area, :float

    Room.reset_column_information
    Room.find_each { |c| c.update_attribute(:area, c.area_old) } 
    remove_column :rooms, :area_old
  end

  def down
  end
end
