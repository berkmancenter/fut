class CourtDecisionDetail < ActiveRecord::Base
  belongs_to :test_answer
  attr_accessible :test_answer_id, :purpose, :character, :use, :nature, :amount, :financial
  validates :purpose, :length => { :in => 3..200, :message => "should be between 3 ~ 200 characters" }
  validates :character, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  validates :use, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  validates :nature, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  validates :amount, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  validates :financial, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  
end
