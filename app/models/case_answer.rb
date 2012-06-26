class CaseAnswer < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :case
  belongs_to :test_answer
end
