class Case < ActiveRecord::Base
  belongs_to :original_resource , :class_name => 'Attachment'
  belongs_to :derivative_resource , :class_name => 'Attachment'
  belongs_to :court_decision, :class_name => 'TestAnswer'
  has_many :case_answers
  belongs_to :role
  attr_accessible :title, :facts, :no_of_tests, :court_decision_id, :original_resource_id, :derivative_resource_id, :role_id
  validates :title, :uniqueness => true, :length => { :in => 3..80, :message => "should be between 3 ~ 80 characters" }
  validates :facts, :length => { :in => 3..600 , :message => "should be between 3 ~ 600 characters"}

  def get_report
    report = [{:answer => self.court_decision.purpose.content, :court_details => self.court_decision.court_decision_detail.purpose}] 
    report << {:answer => self.court_decision.character.content, :court_details => self.court_decision.court_decision_detail.character}
    report << {:answer => self.court_decision.use.content, :court_details => self.court_decision.court_decision_detail.use}
    report << {:answer => self.court_decision.nature.content, :court_details => self.court_decision.court_decision_detail.nature}
    report << {:answer => self.court_decision.amount.content, :court_details => self.court_decision.court_decision_detail.amount}
    report << {:answer => self.court_decision.financial.content, :court_details => self.court_decision.court_decision_detail.financial}
    return report
  end
end
