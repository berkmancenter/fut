class TestAnswer < ActiveRecord::Base
  belongs_to :purpose , :class_name => 'Answer'
  belongs_to :character , :class_name => 'Answer'
  belongs_to :use , :class_name => 'Answer'
  belongs_to :nature , :class_name => 'Answer'
  belongs_to :amount , :class_name => 'Answer'
  belongs_to :impact , :class_name => 'Answer'
  has_one :case, :foreign_key => :court_decision_id
  belongs_to :tested_case, :class_name => 'Case'
  has_one :fair_use_test  
  attr_accessible :purpose_id , :character_id ,:use_id ,:nature_id ,:amount_id ,:impact_id, :tested_case_id, :result

  def self.calculate_fair_use (test_answer)
  	sum = 0
  	sum += test_answer.purpose.value
  	sum += test_answer.character.value
  	sum += test_answer.use.value
  	sum += test_answer.nature.value
  	sum += test_answer.amount.value
  	sum += test_answer.impact.value

  	#Tie Breaker
  	if sum == 0
  	sum += test_answer.impact.value
  	end

  	#Caclulate 
  	if sum > 0
  		test_answer.result = true
      test_answer.save
      return true
  	else sum < 0
  	  test_answer.result = false
      test_answer.save
      return false
  	end
  end   
end
