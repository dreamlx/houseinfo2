class Builder < ActiveRecord::Base
  attr_accessible :code, :desc, :title
  has_many :units
end
