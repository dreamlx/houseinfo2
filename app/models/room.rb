class Room < ActiveRecord::Base
  attr_accessible :area, :building_id, :room_model_id, :room_no, :unit_id
  belongs_to :building
  belongs_to :room_model
  belongs_to :unit
end
