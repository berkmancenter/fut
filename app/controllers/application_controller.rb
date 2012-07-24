class ApplicationController < ActionController::Base
  protect_from_forgery

  protected
  def check_visitor
  	if session[:visitor_id]
  		@current_visitor= Visitor.find(session[:visitor_id])
  		return true
  	else
  		@current_visitor = Visitor.create
  		session[:visitor_id] = @current_visitor.id
  		return false
  	end
  end

  def check_role
  	if @current_visitor.role
  		@current_role = @current_visitor.role
  		return true
  	else
  		redirect_to home_path
  		return false
  	end
  end
end
