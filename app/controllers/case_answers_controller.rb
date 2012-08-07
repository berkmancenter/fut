class CaseAnswersController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role
	def new
		@case_answer= CaseAnswer.new
		@legal_case = LegalCase.find_by_title params[:legal_case_id]
		# To make sure that the requested case has the same current role
		unless @legal_case.roles.include? @current_role
			redirect_to home_path
		else
			@facts = @legal_case.facts.split(". ") 
			@questions = Question.essential
			@test_answer = TestAnswer.new
		end	
	end

	def show
		@legal_case = LegalCase.find_by_title params[:legal_case_id]
		# To make sure that the corresponding case_answer id associated with this case
		@case_answer= @legal_case.case_answers.find params[:id]
		@court_answers_report = @legal_case.get_report
		@answers_of_case = @case_answer.test_answer.get_answers
		@questions= Question.essential
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