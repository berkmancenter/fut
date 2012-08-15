class Visitor < ActiveRecord::Base
  attr_accessible :quiz
  belongs_to :role
  has_many :calculators, :as => :owner
  has_many :case_answers, :as => :owner
  validates :name, :length => { :maximum => 30 }
  validates :progress, :inclusion => { :in => 0..3 }

	public
	def progress
		total = 0
		if self.quiz == true 
			total+=1
		end
		if self.case_answers != []
			total+=1
		end
		return total
	end
end
