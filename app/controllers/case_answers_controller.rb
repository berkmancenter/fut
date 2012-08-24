class CaseAnswersController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role
	
	def show
		@legal_case = LegalCase.find_by_title params[:legal_case_id].gsub("_"," ")
		# To make sure that the corresponding case_answer id associated with this case
		@case_answer= @legal_case.case_answers.find params[:id]
		@court_answers_report = @legal_case.get_report
		@answers_of_case = @case_answer.test_answer.get_answers
		@court_statistics = @legal_case.court_decision.statistics
		@answer_statistics = @case_answer.test_answer.statistics
		@questions= Question.essential.order('id')
	end
end