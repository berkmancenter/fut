class Test < ActiveRecord::Base
  has_many :selected_answers
  belongs_to :owner, :polymorphic => true
  attr_accessible :name, :owner_id

  def self.calculate_fair_use (test)
  	sum=0
  	test.selected_answers.each do |selected_answer|
  		sum+= selected_answer.answer.value
  	end

  	#Tie Breaker
  	if sum = 0
  	sum += test.selected_answers.last.answer.value
  	end

  	#Caclulate 
  	if sum > 0
  		test.result = true
  	else sum < 0
  		test.result = false
  	end
  	test.save
  	return test.result
  end 

end
