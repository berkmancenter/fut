class Question < ActiveRecord::Base
  has_many :answers
  attr_accessible :content
end
