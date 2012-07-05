class FairUseTestsController < ApplicationController

  def create
  	@fair_use_test = FairUseTest.new(params[:fair_use_test])
    @fair_use_test.owner= Visitor.last
    @fair_use_test.save
  	redirect_to fair_use_tests_path
  end

  def show
  	@fair_use_test= FairUseTest.find params[:id]
    @answers_of_test=[@fair_use_test.test_answer.purpose,@fair_use_test.test_answer.character,@fair_use_test.test_answer.use,@fair_use_test.test_answer.nature,@fair_use_test.test_answer.amount,@fair_use_test.test_answer.impact]
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
