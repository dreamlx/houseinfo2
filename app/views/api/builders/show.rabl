object @builder
attributes :id, :code, :title
child :units do |unit|
  attribute :id 
  attribute :area
  attribute :room_no
  attribute :unit_model
end