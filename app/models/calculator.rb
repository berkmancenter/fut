class Calculator < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :test_answer
  attr_accessible :owner_id, :test_answer_id
end
