class Aspect < ActiveRecord::Base
  belongs_to :question
  attr_accessible :name, :explanation, :question_id
end
