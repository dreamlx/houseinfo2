class Building < ActiveRecord::Base
  attr_accessible :desc, :title
  has_many :rooms, order: 'room_no'
  has_many :units, through: :rooms, :uniq => true
end
