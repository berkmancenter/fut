class CaseAnswersController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role, :only => [:new, :show]
	def new
		@case_answer= CaseAnswer.new
		@case = Case.find_by_title params[:case_id]
		@facts = @case.facts.split(". ") 
		@questions = Question.all
		@test_answer = TestAnswer.new	
	end

	def show
		@case_answer = CaseAnswer.find params[:id]
		@case = Case.find_by_title params[:case_id]
		@court_answers_report = @case.get_report
		@answers_of_case = @case_answer.get_answers
		@questions= Question.all
	end

	#We don't want these two actions anymore
	def index
		@case_answers = Visitor.last.case_answers.all
	end

	def destroy
	  	@case_answer = CaseAnswer.find params[:id]
	  	@case_answer.test_answer.destroy
	  	@case_answer.destroy
	  	redirect_to :back
  end
end
