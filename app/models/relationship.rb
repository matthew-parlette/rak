class Relationship < ActiveRecord::Base
  belongs_to :user
  has_many :idea
  validates :title, presence: true
end
