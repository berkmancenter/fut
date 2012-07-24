class Specialization < ActiveRecord::Base
  belongs_to :legal_case
  belongs_to :role
end
