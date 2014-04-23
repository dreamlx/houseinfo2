class Unit < ActiveRecord::Base
  attr_accessible :title, :desc
  has_many :rooms
end
