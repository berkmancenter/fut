class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :cases
  has_many :visitors

end
