class CaseAnswer < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :case
  belongs_to :test_answer
  attr_accessible :case_id, :owner_id, :test_answer_id


  def get_answers
	answers = [self.test_answer.purpose]
	answers << self.test_answer.character
	answers << self.test_answer.use
	answers << self.test_answer.nature
	answers << self.test_answer.amount
	answers << self.test_answer.financial  
  	return answers
  end
end
