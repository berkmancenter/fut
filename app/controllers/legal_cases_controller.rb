class LegalCasesController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role, :only => [:show, :index]
	
	def index
		@legal_cases= @current_role.legal_cases
	end

	def show
		@legal_case = LegalCase.find_by_title (params[:id]).gsub("_"," ")
		# To make sure that the requested case has the same current role
		unless @legal_case.roles.include? @current_role
			redirect_to home_path
		else
			# Neded for new case answer partial view
			@questions = Question.essential.order('id')	
			@test_answer = TestAnswer.new
		end	
	end
end
