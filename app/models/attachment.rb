class Attachment < ActiveRecord::Base
  # has_attached_file :source, :styles => { :medium => "238x238>", :thumb => "100x100>"}
  has_one :legal_case, :foreign_key => :original_resource_id
  has_one :legal_case, :foreign_key => :derivative_resource_id
  # validates :source_file_name, :presence => true
  # attr_accessible :source
  validates :name, :presence => true
  validates :url, :presence => true
  validates_format_of :url, :with => %r{\.(png|jpg|jpeg)$}i, :message => "That's not URL for image!"
  attr_accessible :name, :url

end
