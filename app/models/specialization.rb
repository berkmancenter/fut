class Specialization < ActiveRecord::Base
  belongs_to :case
  belongs_to :role
end
