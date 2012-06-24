class FairUseTest < ActiveRecord::Base
  belongs_to :test_answer
  belongs_to :owner, :polymorphic => true
  attr_accessible :name, :owner_id, :test_answer_id
end