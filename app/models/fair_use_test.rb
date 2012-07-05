class FairUseTest < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true  
  belongs_to :test_answer
  attr_accessible :name, :owner_id, :test_answer_id
  validates :name, :length => { :in => 3..80 , :message => "is blank or too short"}
end