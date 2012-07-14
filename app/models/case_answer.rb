class CaseAnswer < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :case
  belongs_to :test_answer
  attr_accessible :case_id, :owner_id, :test_answer_id

end
