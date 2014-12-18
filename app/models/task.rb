class Task < ActiveRecord::Base
  belongs_to :standup, :dependent => :destroy
  validates :standup, :presence => true
end
