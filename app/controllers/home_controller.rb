class HomeController < ApplicationController
  before_filter :check_visitor

  def start_over
  	@current_visitor= Visitor.create
  	session[:visitor_id] = @current_visitor.id
  	redirect_to :back
  end
end
