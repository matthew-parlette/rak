class Idea < ActiveRecord::Base
  belongs_to :relationship
  validates :title, presence: true
end
