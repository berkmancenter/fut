class Attachment < ActiveRecord::Base
  has_attached_file :source, :styles => { :medium => "238x238>", :thumb => "100x100>"}
  has_one :legal_case, :foreign_key => :original_resource_id
  has_one :legal_case, :foreign_key => :derivative_resource_id
  validates :source_file_name, :presence => true
  attr_accessible :source
end
