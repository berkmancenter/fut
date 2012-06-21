class TestAnswersController < ApplicationController
	def create
		@test_answer= TestAnswer.create(params[:test_answer])
		redirect_to "/test_answers/show/#{@test_answer.id}"				
	end
	def show
		@test_answer= TestAnswer.find(params[:id])
		@fair_use_test= FairUseTest.new
		@result = TestAnswer.calculate_fair_use(@test_answer) ? "Fair Use" : "Not Fair Use"
	end
	def delete
		@test_answer= TestAnswer.find(params[:id])
		@test_answer.destroy
		redirect_to "/"
	end
end
