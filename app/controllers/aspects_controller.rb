class AspectsController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role

	def index
	end

end
