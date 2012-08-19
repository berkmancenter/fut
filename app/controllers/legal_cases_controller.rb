class LegalCasesController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role, :only => [:show, :index]
	
	def index
		@legal_cases= @current_role.legal_cases
	end

	def show
		# To make sure that the requested legal case has the same current role
		if @legal_case = LegalCase.find_by_title(params[:id])
			unless @legal_case.roles.include? @current_role
				render :text => "This legal Case is not included in your role"
			end
		else
			render :text => "Wrong Page"
		end
	end
end
