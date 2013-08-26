class Idea < ActiveRecord::Base
  belongs_to :relationship
  
  delegate :user, :to => :relationship, :allow_nil => false
  
  validates :title, presence: true
end
