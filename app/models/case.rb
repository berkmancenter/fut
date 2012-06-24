class Case < ActiveRecord::Base
  belongs_to :original_resource , :class_name => 'Attachment'
  belongs_to :derivative_resource , :class_name => 'Attachment'
  belongs_to :court_decision, :class_name => 'TestAnswer'
  has_many :test_answers, :foreign_key => :tested_case_id
  attr_accessible :title, :facts, :no_of_tests, :court_decision_id, :original_resource_id, :derivative_resource_id
end
