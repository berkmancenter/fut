class FairUseTest < ActiveRecord::Base
  has_one :test_answer
  belongs_to :owner, :polymorphic => true
  attr_accessible :name, :owner_id, :result
end