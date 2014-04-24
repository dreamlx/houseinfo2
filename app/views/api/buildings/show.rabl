object @building
attributes :id, :code, :title
child :units do |unit|
  attribute :id
  attribute :title
  child :rooms do |room|
    attribute :id 
    attribute :area
    attribute :room_no
    child(:room_model){ |r| r.title }
  end
end
