class SessionsController < ApplicationController
  before_filter :check_visitor
  before_filter :check_role, :only => [:desk]

  def start_over
  	@current_visitor= Visitor.create
  	session[:visitor_id] = @current_visitor.id
  	redirect_to :back
  end
end
