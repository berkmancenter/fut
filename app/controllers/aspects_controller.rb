class AspectsController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role

	def index
		@aspects = Aspect.all
		@questions = Question.essential.order('id')
	end

end
