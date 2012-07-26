class Role < ActiveRecord::Base
  attr_accessible :name
  has_many :specializations
  has_many :legal_cases, :through => :specializations
  has_many :visitors
  validates :name, :length => { :in => 3..30 , :message => "should be between 3 ~ 30 characters"}

end
