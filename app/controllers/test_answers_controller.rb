class TestAnswersController < ApplicationController
	before_filter :check_visitor

	def create
		@test_answer= TestAnswer.new(params[:test_answer])	
		if @test_answer.save
			unless params[:legal_case_id]
			#test_answer here refered for calculator test
				@test_answer.result = @test_answer.calculate_fair_use
				@calculator = Calculator.new
				@calculator.test_answer = @test_answer
				@calculator.owner = @current_visitor
				@calculator.save
				@answers_of_test = @test_answer.get_answers 
				@questions= Question.essential.order('id')	
				#Check Tie Break
				if @test_answer.tie_break?
				#In case we need tie Break
					respond_to do |format|	
						format.html { redirect_to @calculator }
		       			format.js { render 'calculators/create_tie_break.js.erb' }

	       			end	
				else
				#In case we don't need tie Break
					respond_to do |format|	
						format.html { redirect_to @calculator }
		       			format.js { render 'calculators/create.js.erb' }

	       			end
				end
				
			else
			#test_answer here refered for case_answer test
				@test_answer.result = @test_answer.calculate_fair_use
				@legal_case = LegalCase.find(params[:legal_case_id])
				#test_answer refer to case_answer for a user
				@ca = CaseAnswer.new(:legal_case_id => @legal_case.id)
				@ca.test_answer = @test_answer
				@ca.owner = @current_visitor
				@ca.save
				redirect_to role_legal_case_case_answer_path(@current_visitor.role.name.gsub(" ","_"),@legal_case.title.gsub(" ","_"),@ca)				
			end
		else
			render :text => "Something Wrong happen while creating new test_answer"
		end				
	end
end
