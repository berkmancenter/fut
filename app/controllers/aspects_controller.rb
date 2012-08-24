class AspectsController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role

	def index
		@aspects = Aspect.all
		@quiz_questions = Question.quiz.sample(4)
	end

end
