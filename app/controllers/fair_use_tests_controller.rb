class FairUseTestsController < ApplicationController

  def create
  	@fair_use_test = FairUseTest.create(params[:fair_use_test])
  	@fair_use_test.owner = Visitor.last
  	@fair_use_test.save
  	redirect_to "/"
  end

  def show
  end
end
