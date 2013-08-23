class Relationship < ActiveRecord::Base
  belongs_to :user
  has_many :idea, dependent: :destroy
  validates :title, presence: true
end
