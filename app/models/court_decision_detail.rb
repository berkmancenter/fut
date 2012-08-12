class CourtDecisionDetail < ActiveRecord::Base
  belongs_to :legal_case
  attr_accessible :legal_case_id, :purpose, :character, :use, :nature, :amount, :financial
  # validates :purpose, :length => { :in => 3..200, :message => "should be between 3 ~ 200 characters" }
  # validates :character, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  # validates :use, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  # validates :nature, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  # validates :amount, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  # validates :financial, :length => { :in => 3..200 , :message => "should be between 3 ~ 200 characters"}
  validates :purpose, :presence => true
  validates :character, :presence => true
  validates :use, :presence => true
  validates :nature, :presence => true
  validates :amount, :presence => true
  validates :financial, :presence => true
end
