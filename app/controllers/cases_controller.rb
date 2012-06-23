class CasesController < ApplicationController
	def index
		@cases= Case.all
	end

	def show
		@case = Case.find(params[:id]) 
	end

	def new
		@case = Case.new
	end

	def create
		@case= Case.create(params[:case])
		@original = Attachment.new
		@original.source =  params[:original]
		@derivative = Attachment.new
		@derivative.source = params[:derivative]
		@case.original_resource = @original 
		@case.derivative_resource = @derivative
		@case.save
		redirect_to "/cases/show/#{@case.id}"
	end
end
