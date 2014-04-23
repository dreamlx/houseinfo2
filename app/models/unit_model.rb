class UnitModel < ActiveRecord::Base
  attr_accessible :desc, :title
  has_many :unit
end
