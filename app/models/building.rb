class Building < ActiveRecord::Base
  attr_accessible :desc, :title
  has_many :rooms
  has_many :units, through: :rooms, :uniq => true
end
