class Comment < ActiveRecord::Base
  belongs_to :standup
  validates :standup, :presence => true
  validates_presence_of :body
end
