class Building < ActiveRecord::Base
  attr_accessible :desc, :title, :code
  has_many :rooms, order: 'room_no'
  has_many :units, through: :rooms, :uniq => true
end
