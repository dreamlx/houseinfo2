class UnitModel < ActiveRecord::Base
  attr_accessible :desc, :title
  has_many :units
end
