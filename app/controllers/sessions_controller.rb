class SessionsController < ApplicationController
  before_filter :check_visitor
  before_filter :check_role, :only => [:desk]
  
  def index
  end

  def desk
  end
end
