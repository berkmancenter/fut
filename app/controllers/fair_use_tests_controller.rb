class FairUseTestsController < ApplicationController

  def create
  	@fair_use_test = FairUseTest.create(params[:fair_use_test])
  	redirect_to "/"
  end

  def show
  end
end
