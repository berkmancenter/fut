class QuestionsController < ApplicationController
	before_filter :check_visitor
  def index
  	@questions= Question.all
  	@test_answer= TestAnswer.new
  end
end
