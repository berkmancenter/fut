class Visitor < ActiveRecord::Base
  belongs_to :role
  has_many :calculators, :as => :owner
  has_many :case_answers, :as => :owner
  validates :name, :length => { :maximum => 30 }
end
