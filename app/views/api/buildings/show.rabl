object @building
attributes :id, :code, :title
child :rooms do |room|
  attribute :id 
  attribute :area
  attribute :room_no
  attribute :room_model
  attribute :unit
end