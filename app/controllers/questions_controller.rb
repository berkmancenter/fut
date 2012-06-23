class QuestionsController < ApplicationController
  def index
  	@questions= Question.all
  	@test_answer= TestAnswer.new
  end
end
