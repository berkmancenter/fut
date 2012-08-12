class Aspect < ActiveRecord::Base
  has_many :questions
  attr_accessible :name, :explanation
end
