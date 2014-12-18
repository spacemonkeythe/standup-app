class Task < ActiveRecord::Base
  belongs_to :standup, :dependent => :destroy
end
