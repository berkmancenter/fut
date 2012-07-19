class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :specializations
  has_many :cases, :through => :specializations
  has_many :visitors

end
