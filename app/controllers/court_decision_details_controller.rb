class CourtDecisionDetailsController < ApplicationController
	def new
		@case = Case.find_by_title(params[:case_id])
		@court_decision_detail= CourtDecisionDetail.new
		@details = :purpose, :character, :use, :nature, :amount, :financial
	end
	
	def create
		@case = Case.find (params[:case_id])
		@court_decision_detail= CourtDecisionDetail.create params[:court_decision_detail]
		@case.court_decision.court_decision_detail = @court_decision_detail
		redirect_to case_path(@case.title)
	end
end
