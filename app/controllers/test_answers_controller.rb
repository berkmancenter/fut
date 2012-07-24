class TestAnswersController < ApplicationController
	before_filter :check_visitor
	def new
		@legal_case = LegalCase.find_by_title params[:legal_case_id] 
		@questions = Question.all
		@test_answer = TestAnswer.new
	end

	def create
		@test_answer= TestAnswer.new(params[:test_answer])
		@test_answer.result = TestAnswer.calculate_fair_use(@test_answer)
		
		if @test_answer.save

			unless params[:legal_case_id]
				#test_answer for calculator test
				@calculator = Calculator.new
				@calculator.test_answer = @test_answer
				@calculator.owner = @current_visitor
				@calculator.save
				redirect_to @calculator
			else
				@legal_case = LegalCase.find(params[:legal_case_id])
				#test_answer refer to court decision for a case
				if  @legal_case.court_decision.nil?
					@legal_case.court_decision = @test_answer
					@legal_case.save 
					redirect_to new_legal_case_court_decision_detail_path(@legal_case.title)
				else
				#test_answer refer to case_answer for a user
					@ca = CaseAnswer.new(:legal_case_id => @legal_case.id)
					@ca.test_answer = @test_answer
					@ca.owner = @current_visitor
					@ca.save
					redirect_to legal_case_case_answer_path(@legal_case.title,@ca)				
				end
			end
		else
			render :text => "3abeeet"
		end				
	end
	
	def edit
		@legal_case = LegalCase.find_by_title params[:legal_case_id] 
		@questions = Question.all
		@test_answer = TestAnswer.find(params[:id])
	end

	def update
		@test_answer = TestAnswer.find(params[:id])
		@test_answer.update_attributes(params[:test_answer])
		@legal_case = @test_answer.court_decision_case
		redirect_to edit_case_court_decision_detail_path(@legal_case.title,@test_answer.court_decision_detail)
	end

	def destroy
		@test_answer= TestAnswer.find(params[:id])
		@test_answer.destroy
		redirect_to home_path
	end
end
