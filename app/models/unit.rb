class Unit < ActiveRecord::Base
  attr_accessible :title, :desc
  has_many :rooms, order: 'room_no'

  def building_rooms(building_id)
    rooms = Room.where('building_id = ? and unit_id = ?', building_id, self.id)
    rooms.order(:room_no)
  end
end
