class Test < ActiveRecord::Base
  has_many :selected_answers
  belongs_to :owner, :polymorphic => true
  attr_accessible :name, :owner_id 
end
