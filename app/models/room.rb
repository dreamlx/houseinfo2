class Room < ActiveRecord::Base
  attr_accessible :area, :building_id, :room_model_id, :room_no, :unit_id, :state
  belongs_to :building
  belongs_to :room_model
  belongs_to :unit
  def title
    self.room_no
  end
  state_machine :initial => :on_sale do
    event :sold do
      transition :on_sale => :sold_out
    end

    event :unsold do
      transition :sold_out => :on_sale
    end
  end
end
