class CasesController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role, :only => [:show, :index]
	
	def index
		@cases= @current_role.cases
	end

	def show
		@case = Case.find_by_title(params[:id])
	end

	#The Next Actions for Administration purpose
	def new
		@case = Case.new :role_id => 5
	end

	def create
		@case= Case.new(params[:case])
		@original = Attachment.new
		@original.source =  params[:original]
		@derivative = Attachment.new
		@derivative.source = params[:derivative]
		flash[:notice] = nil
		if  @derivative.save && @original.save
			@case.original_resource = @original 
			@case.derivative_resource = @derivative
			if @case.save
				redirect_to new_case_test_answer_path(@case.title)
			else
				render 'new'
			end	
		else
			if @case.title == "" || @case.facts == ""
				@case.save
			end
			flash[:notice] = "Please upload the 2 recources of case!"
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

	def edit
		@case = Case.find_by_title(params[:id])
	end

	def update
		@case = Case.find(params[:id])
		@case.update_attributes(params[:case])
		if params[:original] != nil
			@new_original = Attachment.new
			@new_original.source = params[:original]
			if @case.original_resource 
				@case.original_resource.destroy
			end
			@case.original_resource = @new_original
		end
		if params[:derivative] != nil
			@new_derivative = Attachment.new
			@new_derivative.source = params[:derivative]
			if @case.derivative_resource
				@case.derivative_resource.destroy
			end
			@case.derivative_resource = @new_derivative
		end
		@case.save
		redirect_to edit_case_test_answer_path(@case.title,@case.court_decision)
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
