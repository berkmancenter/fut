class Question < ActiveRecord::Base
  has_many :answers
  has_one :aspect
  attr_accessible :content, :hint, :essential
  validates :content, :presence =>true, :length => { :maximum => 200 }
  validates :hint, :length => { :maximum => 600 }
  scope :essential , where(:essential => true)
  scope :quiz , where(:essential => false)

  public
	def flag
    self.content.split(" ")[0].downcase
  end

end
