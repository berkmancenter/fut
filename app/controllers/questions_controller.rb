class QuestionsController < ApplicationController
  def show
  	@question = Question.find(params[:id])
  	@selected_answer= SelectedAnswer.new
  end
  def index
  	@questions= Question.all
  	@selected_answer= SelectedAnswer.new
  end
end
