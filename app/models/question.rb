class Question < ActiveRecord::Base
  has_many :answers
  attr_accessible :content
  validates :content, :presence =>true, :length => { :maximum => 80 }
  validates :explanation, :length => { :maximum => 600 }

  public
	def flag
		unless self.id == 6
    		self.content.split(" ")[0].downcase
    	else
    		#This's Temporary, Don't forget to change association name better
    		"impact"
    	end
    end

end
