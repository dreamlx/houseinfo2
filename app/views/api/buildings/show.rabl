object @building
attributes :id, :code, :title
child :units do |unit|
  attribute :id
  attribute :title
  child :rooms do |room|
    if room.buidling_id = @building.id
      attribute :id 
      attribute :area
      attribute :room_no
      attribute :state
      child :room_model do |room|
        attribute :title
      end
    end
  end
end
