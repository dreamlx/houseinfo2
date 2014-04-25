class Unit < ActiveRecord::Base
  attr_accessible :title, :desc
  has_many :rooms, order: 'room_no'
end
