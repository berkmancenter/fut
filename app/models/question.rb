class Question < ActiveRecord::Base
  has_many :answers
  attr_accessible :content
  validates :content, :presence =>true, :length => { :maximum => 80 }
  validates :explanation, :length => { :maximum => 600 }

  public
	def flag
    self.content.split(" ")[0].downcase
  end

end
