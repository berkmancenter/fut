class CasesController < ApplicationController
	def index
		@cases= Case.all
	end

	def show
		@case = Case.find_by_title(params[:id])
	end

	def new
		@case = Case.new
	end

	def create
		@case= Case.new(params[:case])
		@original = Attachment.new
		@original.source =  params[:original]
		@derivative = Attachment.new
		@derivative.source = params[:derivative]
		@case.original_resource = @original 
		@case.derivative_resource = @derivative
		if @case.save
			redirect_to new_case_test_answer_path(@case.title)
		else
			render 'new'
		end
		# @questions = Question.all
		# @test_answer = TestAnswer.new

		#Comment this untill fixing ajax upload file issue

		#respond_to do |format|
       	#	format.html { redirect_to "/cases/show/#{@case.id}"}
       	#	format.js 
   		#end

   		

	end

	def destroy
		@case = Case.find(params[:id])
		if @case.court_decision
			@case.court_decision.destroy
		end
		@case.destroy
		redirect_to :back
	end
end
