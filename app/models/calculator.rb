class Calculator < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  has_one :test_answer, :as => :target
  attr_accessible :owner_id, :test_answer_id
end
