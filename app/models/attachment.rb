class Attachment < ActiveRecord::Base
  has_attached_file :source
  has_one :case, :foreign_key => :original_resource_id
  has_one :case, :foreign_key => :derivative_resource_id
  validates :source_file_name, :presence => true
end
