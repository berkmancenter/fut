class Answer < ActiveRecord::Base
  belongs_to :question
  attr_accessible :content, :value, :question_id
end
