class RolesController < ApplicationController
	before_filter :check_visitor
	def set_role
		@current_visitor.role = Role.find params[:id]
		@current_visitor.save
		redirect_to fair_path
	end
end
