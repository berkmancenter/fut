class RolesController < ApplicationController
	before_filter :check_visitor
	def show
		@current_role = Role.find_by_name params[:id].gsub("_"," ")
		@current_visitor.role = @current_role
		@current_visitor.save	
	end
end
