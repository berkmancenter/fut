class Case < ActiveRecord::Base
  belongs_to :original_resource , :class_name => 'Attachment'
  belongs_to :derivative_resource , :class_name => 'Attachment'
  belongs_to :court_decision, :class_name => 'TestAnswer'
  has_many :case_answers
  attr_accessible :title, :facts, :no_of_tests, :court_decision_id, :original_resource_id, :derivative_resource_id
  validates :title, :presence => true, :uniqueness => true, :length => { :in => 3..80 }
  validates :facts, :presence => true, :length => { :in => 3..600 }
end
