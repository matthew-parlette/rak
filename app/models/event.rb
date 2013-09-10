class Event < ActiveRecord::Base
  belongs_to :idea
  
  validates :title, presence: true
end
