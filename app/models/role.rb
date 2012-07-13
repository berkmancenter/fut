class Role < ActiveRecord::Base
  attr_accessible :name
  belongs_to :case
  has_many :visitors

end
