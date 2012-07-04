class CaseAnswersController < ApplicationController
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
		@result = @case_answer.test_answer.result ? "Fair Use" : "Not Fair Use"
		@court_result = @case.court_decision.result ? "Fair Use" : "Not Fair Use"
	end

	def index
		@case_answers = Visitor.last.case_answers.all
	end
end
