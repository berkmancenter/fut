class TestsController < ApplicationController
  def new
  	@test = Test.new
  end

  def create
  	@test = Test.create(params[:test])
  	@test.owner = Visitor.last
  	@test.save
  	redirect_to "/questions/show/1"
  end

  def show
  	@test = Test.find(params[:id])
  	sum=0
  	@test.selected_answers.each do |selected_answer|
  		sum+= selected_answer.answer.value
  	end

  	if sum = 0
  	sum += @test.selected_answers.last.answer.value
  	end

  	if sum > 0
  		@result = "Fair Use"
  	else sum < 0
  		@result = "Not Fair Use"
  	end
  end
end
