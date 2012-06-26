class FairUseTest < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true  
  belongs_to :test_answer
  attr_accessible :name, :owner_id, :test_answer_id
  validates :name, :presence =>true, :length => { :maximum => 80 }
end