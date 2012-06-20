class TestsController < ApplicationController
  def new
  	@test = Test.new
  end

  def create
  	@test = Test.create(params[:test])
  	@test.owner = Visitor.last
  	@test.save
  	redirect_to "/questions/"
  end

  def show
  	@test = Test.find(params[:id])
    @result = Test.calculate_fair_use(@test) ? "Fair Use" : "Not Fair Use"
  end
end
