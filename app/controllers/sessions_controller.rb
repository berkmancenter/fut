class SessionsController < ApplicationController
  before_filter :check_visitor
  before_filter :check_role, :only => [:fair]
  def index

  end

  def fair

  end
end
