class CasesController < ApplicationController
	def index
		@cases= Case.all
	end

	def show
		@case = Case.find_by_title(params[:id])
	end

	def new
		@case = Case.new
		@questions = Question.all
		@test_answer = TestAnswer.new
	end

	def create
		@case= Case.new(params[:case])
		@original = Attachment.new
		@original.source =  params[:original]
		@derivative = Attachment.new
		@derivative.source = params[:derivative]
		@case.original_resource = @original 
		@case.derivative_resource = @derivative
		@case.save
		respond_to do |format|
       		format.html { redirect_to "/cases/show/#{@case.id}"}
       		format.js 
   		end
	end
end
