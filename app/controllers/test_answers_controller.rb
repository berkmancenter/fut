class TestAnswersController < ApplicationController
	before_filter :check_visitor
	def new
		@case = Case.find_by_title params[:case_id] 
		@questions = Question.all
		@test_answer = TestAnswer.new
	end

	def create
		@test_answer= TestAnswer.new(params[:test_answer])
		@test_answer.result = TestAnswer.calculate_fair_use(@test_answer)
		
		if @test_answer.save

			unless params[:case_id]
				#test_answer for calculator test
				@calculator = Calculator.new(:test_answer_id => @test_answer.id)
				@calculator.owner = @current_visitor
				@calculator.save
				redirect_to @calculator
			else
				@case = Case.find(params[:case_id])
				#test_answer refer to court decision for a case
				if  @case.court_decision.nil?
					@case.court_decision = @test_answer
					@case.save 
					redirect_to new_case_court_decision_detail_path(@case.title)
				else
				#test_answer refer to case_answer for a user
					@ca = CaseAnswer.new(:test_answer_id => @test_answer.id,:case_id => @case.id)
					@ca.owner = @current_visitor
					@ca.save
					redirect_to case_case_answer_path(@case.title,@ca)				
				end
			end
		else
			render :text => "3abeeet"
		end				
	end
	
	def edit
		@case = Case.find_by_title params[:case_id] 
		@questions = Question.all
		@test_answer = TestAnswer.find(params[:id])
	end

	def update
		@test_answer = TestAnswer.find(params[:id])
		@test_answer.update_attributes(params[:test_answer])
		@case = @test_answer.court_decision_case
		redirect_to edit_case_court_decision_detail_path(@case.title,@test_answer.court_decision_detail)
	end

	def destroy
		@test_answer= TestAnswer.find(params[:id])
		@test_answer.destroy
		redirect_to home_path
	end
end
