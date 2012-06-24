class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :test_answers
  attr_accessible :content, :value, :question_id
  validates :content, :presence =>true, :length => { :maximum => 80 }
  validates :value, :inclusion => { :in => -1..1 }
end
