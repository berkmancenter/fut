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

  public
    def calculate_fair_use   	
      result = self.tie_break? ?  self.financial.value : self.get_sum
      return (result > 0) ? true : false
    end
    
    def tie_break?
      sum = self.get_sum
      if sum == 0 
        return true
      else
        return false
      end
    end

   def get_sum
    sum = 0
    sum += self.purpose.value
    sum += self.character.value
    sum += self.use.value
    sum += self.nature.value
    sum += self.amount.value
    sum += self.financial.value
    return sum
  end
  
  def get_result
      if self.result == true
        return "Fair Use"
      elsif self.result == false
        return "Not Fair Use"
      else
        return "Undecided"
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

  def statistics
    fu=0
    nfu=0
    un=0 
    answers= self.get_answers
    answers.each do |answer|  
      if answer.value == 1
        fu= fu+1
      elsif answer.value == -1
        nfu= nfu+1
      else
        un= un+1
      end   
    end
    return [fu,nfu,un]
  end  
end
