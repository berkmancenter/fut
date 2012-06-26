class Visitor < ActiveRecord::Base
  has_many :test_answers, :as => :owner
  validates :name, :length => { :maximum => 30 }
end
