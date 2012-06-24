class Visitor < ActiveRecord::Base
  has_many :selected_answers, :as => :owner
  has_many :tests, :as => :owner
  validates :name, :length => { :maximum => 30 }
end
