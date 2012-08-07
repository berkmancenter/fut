class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :aspect
  attr_accessible :content, :explanation
  validates :content, :presence =>true, :length => { :maximum => 80 }
  validates :explanation, :length => { :maximum => 600 }

  public
	def flag
    self.content.split(" ")[0].downcase
  end

end
