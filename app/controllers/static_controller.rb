class StaticController < ApplicationController
  before_filter :check_visitor
  def About
  end

  def LearnMore
  end
end
