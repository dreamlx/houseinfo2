class Room < ActiveRecord::Base
  attr_accessible :area, :building_id, :room_model_id, :room_no, :unit_id, :state, :orders
  belongs_to :building
  belongs_to :room_model
  belongs_to :unit
  has_many   :orders

  def title
    self.room_no.to_s
  end

  state_machine :initial => :on_sale do
    # order a room
    event :order do
      transition :on_sale => :ordered
    end

    # unorder a room
    event :unorder do
      transition :ordered => :on_sale
    end

    # confirm a order
    event :sold do
      transition :ordered => :sold_out
    end

    # recycle a room
    event :unsold do
      transition :sold_out => :on_sale
    end
  end

  def self.change_area(building_title, model_title, area1, area2)
    rooms = Room.includes(:building, :room_model).where("buildings.title = ? and room_models.title = ?", 'building_title','model_title')
    rooms.each do |room|
      if room.room_no == 101
        room.update_attribute(:area, area1)
      else
        room.update_attribute(:area, area2)
      end
    end
  end
end
