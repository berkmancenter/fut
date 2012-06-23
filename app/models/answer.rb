class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :test_answers
  attr_accessible :content, :value, :question_id
end
