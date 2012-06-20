class SelectedAnswersController < ApplicationController
	def create
		@selected_answer= SelectedAnswer.create(params[:selected_answer])
		@selected_answer.owner = Visitor.last
		@selected_answer.save
		if (@question_id = @selected_answer.question.id) != 6 
			#redirect_to "/questions/show/#{@question_id + 1}"
			respond_to do |format|
				format.js  
			end
		else
			 redirect_to "/tests/show/#{@selected_answer.test.id}"				
		end
	end

	def edit
		@selected_answer= SelectedAnswer.find(params[:id])
		respond_to do |format|
			format.js  
		end
	end
end
