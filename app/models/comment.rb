class Comment < ActiveRecord::Base
  belongs_to :standup
  belongs_to :user
  validates :standup, :presence => true
  validates_presence_of :body
end
