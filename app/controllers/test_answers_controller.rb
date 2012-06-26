class TestAnswersController < ApplicationController
	def create
		@test_answer= TestAnswer.new(params[:test_answer])
		@test_answer.owner = Visitor.last
		@test_answer.result = TestAnswer.calculate_fair_use(@test_answer)
		@test_answer.save

		unless params[:case_id]
			redirect_to "/test_answers/show/#{@test_answer.id}"
		else
			@c = Case.find(params[:case_id])
			if  @c.court_decision.nil?
				@c.court_decision = @test_answer
				@c.save 
				redirect_to "/cases/"
			else
			@test_answer.tested_case = @c
			@test_answer.save
			redirect_to "/test_answers/show/#{@test_answer.id}"	
			end
		end				
	end
	def show
		@test_answer= TestAnswer.find(params[:id])
		@result = @test_answer.result ? "Fair Use" : "Not Fair Use"	
		if @test_answer.tested_case.nil?
			@fair_use_test= FairUseTest.new
			render 'simple_answer'	
		else
			@court_result = @test_answer.tested_case.court_decision.result ? "Fair Use" : "Not Fair Use"
			render 'case_answer'
		end	
	end
	def delete
		@test_answer= TestAnswer.find(params[:id])
		@test_answer.destroy
		redirect_to "/"
	end
end
