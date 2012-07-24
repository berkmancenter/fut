class LegalCasesController < ApplicationController
	before_filter :check_visitor
	before_filter :check_role, :only => [:show, :index]
	
	def index
		@legal_cases= @current_role.legal_cases
	end

	def show
		# To make sure that the requested legal case has the same current role
		if @legal_case = LegalCase.find_by_title(params[:id])
			unless @legal_case.roles.include? @current_role
				render :text => "This legal Case is not included in your role"
			end
		else
			render :text => "Wrong Page"
		end
	end

	#The Next Actions for Administration purpose
	def new
		@legal_case = LegalCase.new
	end

	def create
		@legal_case= LegalCase.new(params[:legal_case])
		@legal_case.attributes = {'role_ids' => []}.merge(params[:legal_case] || {})
		@original = Attachment.new
		@original.source =  params[:original]
		@derivative = Attachment.new
		@derivative.source = params[:derivative]
		flash[:notice] = nil
		if  @derivative.save && @original.save
			@legal_case.original_resource = @original 
			@legal_case.derivative_resource = @derivative
			if @legal_case.save
				redirect_to new_legal_case_test_answer_path(@legal_case.title)
			else
				render 'new'
			end	
		else
			if @legal_case.title == "" || @legal_case.facts == ""
				@legal_case.save
			end
			flash[:notice] = "Please upload the 2 recources of the legal Case!"
			render 'new'
		end
	end

	def edit
		@legal_case = LegalCase.find_by_title(params[:id])
	end

	def update
		@legal_case = LegalCase.find(params[:id])
		@legal_case.update_attributes(params[:legal_case])
		if params[:original] != nil
			@new_original = Attachment.new
			@new_original.source = params[:original]
			if @legal_case.original_resource 
				@legal_case.original_resource.destroy
			end
			@legal_case.original_resource = @new_original
		end
		if params[:derivative] != nil
			@new_derivative = Attachment.new
			@new_derivative.source = params[:derivative]
			if @legal_case.derivative_resource
				@legal_case.derivative_resource.destroy
			end
			@legal_case.derivative_resource = @new_derivative
		end
		@legal_case.save
		redirect_to edit_legal_case_test_answer_path(@legal_case.title,@legal_case.court_decision)
	end
	
	def destroy
		@legal_case = LegalCase.find(params[:id])
		if @legal_case.court_decision
			@legal_case.court_decision.destroy
		end
		@legal_case.destroy
		redirect_to :back
	end
end
