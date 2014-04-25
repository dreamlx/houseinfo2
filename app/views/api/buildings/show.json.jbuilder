json.building do
  json.id     @building.id
  json.title  @building.title
  json.units  @building.units do |u|
    json.id     u.id
    json.title  u.title
    json.rooms  u.building_rooms(@building.id) do |r|
      json.id         r.id
      json.room_no    r.room_no
      json.area       r.area
      json.room_model r.room_model.title
      json.state      r.state
    end
  end
end


