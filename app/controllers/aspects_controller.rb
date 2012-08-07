class AspectsController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role

	def index
		@aspects = Aspect.all
	end

end
