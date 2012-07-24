class CourtDecisionDetailsController < ApplicationController
	def new
		@legal_case = LegalCase.find_by_title(params[:legal_case_id])
		@court_decision_detail= CourtDecisionDetail.new
		@details = :purpose, :character, :use, :nature, :amount, :financial
	end
	
	def create
		@legal_case = LegalCase.find (params[:legal_case_id])
		@court_decision_detail= CourtDecisionDetail.create params[:court_decision_detail]
		@legal_case.court_decision_detail = @court_decision_detail
		redirect_to legal_case_path(@legal_case.title)
	end

	def edit
		@legal_case = LegalCase.find_by_title(params[:legal_case_id])
		@court_decision_detail= CourtDecisionDetail.find(params[:id])
		@details = :purpose, :character, :use, :nature, :amount, :financial
	end

	def update
		@court_decision_detail = CourtDecisionDetail.find(params[:id])
		@court_decision_detail.update_attributes(params[:court_decision_detail])
		@legal_case = @court_decision_detail.legal_case
		redirect_to legal_case_path(@legal_case.title)
	
	end
end
