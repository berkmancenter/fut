class LegalCase < ActiveRecord::Base
  belongs_to :original_resource , :class_name => 'Attachment'
  belongs_to :derivative_resource , :class_name => 'Attachment'
  has_one :court_decision, :class_name => "TestAnswer", :as => :target
  has_one :court_decision_detail
  accepts_nested_attributes_for :court_decision, :court_decision_detail
  accepts_nested_attributes_for :original_resource, :derivative_resource
  has_many :case_answers
  has_many :specializations
  has_many :roles, :through => :specializations
  attr_accessible :court_decision_detail_attributes, :original_resource_attributes, :derivative_resource_attributes, :court_decision_attributes, :test_answer_attributes, :title, :facts, :no_of_tests, :test_answer, :original_resource_id, :derivative_resource_id, :role_ids
  validates :title, :uniqueness => true, :length => { :in => 3..80, :message => "should be between 3 ~ 80 characters" }
  # validates :facts, :length => { :in => 3..600 , :message => "should be between 3 ~ 600 characters"}
  validates :facts, :presence => true
  scope :film_maker, joins(:roles).where('roles.name = ?', "Film Maker")
  
  def get_report
    report = [{:answer => self.court_decision.purpose, :court_details => self.court_decision_detail.purpose}] 
    report << {:answer => self.court_decision.character, :court_details => self.court_decision_detail.character}
    report << {:answer => self.court_decision.use, :court_details => self.court_decision_detail.use}
    report << {:answer => self.court_decision.nature, :court_details => self.court_decision_detail.nature}
    report << {:answer => self.court_decision.amount, :court_details => self.court_decision_detail.amount}
    report << {:answer => self.court_decision.financial, :court_details => self.court_decision_detail.financial}
    return report
  end
end
