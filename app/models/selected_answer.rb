class SelectedAnswer < ActiveRecord::Base
  has_one :question, :through => :answer
  belongs_to :owner, :polymorphic => true
  belongs_to :test
  belongs_to :answer
  attr_accessible :answer_id, :owner_id, :test_id
end
