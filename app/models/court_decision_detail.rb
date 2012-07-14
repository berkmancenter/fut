class CourtDecisionDetail < ActiveRecord::Base
  belongs_to :test_answer
  attr_accessible :test_answer_id, :purpose, :character, :use, :nature, :amount, :financial

end
