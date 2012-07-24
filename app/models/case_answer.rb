class CaseAnswer < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  belongs_to :legal_case
  has_one :test_answer, :as => :target
  attr_accessible :legal_case_id, :owner_id, :test_answer_id

end
