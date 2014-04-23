class Unit < ActiveRecord::Base
  attr_accessible :area, :builder_id, :room_no, :unit_model_id
  belongs_to :builder
  belongs_to :unit_model
end
