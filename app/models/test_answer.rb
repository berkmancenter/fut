class TestAnswer < ActiveRecord::Base
  belongs_to :purpose , :class_name => 'Answer'
  belongs_to :character , :class_name => 'Answer'
  belongs_to :use , :class_name => 'Answer'
  belongs_to :nature , :class_name => 'Answer'
  belongs_to :amount , :class_name => 'Answer'
  belongs_to :financial , :class_name => 'Answer'
  belongs_to :target, :polymorphic => true
  attr_accessible :target_type, :target_id ,:purpose_id , :character_id ,:use_id ,:nature_id ,:amount_id ,:financial_id, :result
  validates :purpose_id, :inclusion => { :in => 1..8 }
  validates :character_id, :inclusion => { :in => 9..10 }
  validates :use_id, :inclusion => { :in => 11..13 }
  validates :nature_id, :inclusion => { :in => 14..17 }
  validates :amount_id, :inclusion => { :in => 18..21 }
  validates :financial_id, :inclusion => { :in => 22..23 }
  
  scope :court_decisions, joins(:legal_case)
  scope :case_answers, joins(:case_answer)
  scope :calculators, joins(:calculator)

  def self.calculate_fair_use (test_answer)
  	sum = 0
  	sum += test_answer.purpose.value
  	sum += test_answer.character.value
  	sum += test_answer.use.value
  	sum += test_answer.nature.value
  	sum += test_answer.amount.value
  	sum += test_answer.financial.value
  	#Tie Breaker
  	if sum == 0
  	sum += test_answer.financial.value
  	end
  	#Caclulate 
  	if sum > 0
      return true
  	else sum < 0
      return false
  	end
  end
    
  
  public
  def get_result
      if self.result == true
        return "Fair Use"
      else
        return "Not Fair Use"
      end
          
  end

  def get_answers
    answers = [self.purpose]
    answers << self.character
    answers << self.use
    answers << self.nature
    answers << self.amount
    answers << self.financial  
    return answers
  end 
end
