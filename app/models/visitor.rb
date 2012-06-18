class Visitor < ActiveRecord::Base
  has_many :selected_answers, :as => :owner
  has_many :tests, :as => :owner
end
