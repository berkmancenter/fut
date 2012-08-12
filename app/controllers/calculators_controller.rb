class CalculatorsController < ApplicationController
	before_filter :check_visitor
	def new
		@questions= Question.essential.order('id')	
  		@test_answer= TestAnswer.new
	end

	def show
		@calculator = Calculator.find params[:id]
		@test_answer= @calculator.test_answer
		@answers_of_test = @test_answer.get_answers 
		@questions= Question.essential.order('id')		
	end

	def tie_break
		@calculator = Calculator.last
		@test_answer= @calculator.test_answer
		@answers_of_test = @test_answer.get_answers 
		@questions= Question.essential.order('id')		
	end
end
