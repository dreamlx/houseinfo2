class Building < ActiveRecord::Base
  attr_accessible :desc, :title
  has_many :rooms
end
