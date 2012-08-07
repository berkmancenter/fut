class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :aspect
  attr_accessible :content, :explanation, :aspect_id
  validates :content, :presence =>true, :length => { :maximum => 80 }
  validates :explanation, :length => { :maximum => 600 }
  scope :essential , where(:aspect_id => nil)
  scope :quiz , where(:aspect_id => 1..6 )

  public
	def flag
    self.content.split(" ")[0].downcase
  end

end
