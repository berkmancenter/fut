class FairUseTestsController < ApplicationController

  def create
  	@fair_use_test = FairUseTest.new(params[:fair_use_test])
    @fair_use_test.owner= Visitor.last
    @fair_use_test.save
  	redirect_to fair_use_tests_path
  end

  def show
  	@fair_use_test= FairUseTest.find params[:id]
  	@result = @fair_use_test.test_answer.result ? "Fair Use" : "Not Fair Use"	
  end

  def index
  	@fair_use_tests= FairUseTest.all
  end

  def destroy
  	@fair_use_test = FairUseTest.find params[:id]
  	@fair_use_test.test_answer.destroy
  	@fair_use_test.destroy
  	redirect_to :back
  end
end
