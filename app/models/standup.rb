class Link < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  accepts_nested_attributes_for :tasks, :reject_if => :all_blank, :allow_destroy => true
  validates_presence_of :title
  
  validate :user_quota, :on => :create 

  private 
  def user_quota
    if user.links.today.count >= 1
      errors.add(:base, "Exceeds daily limit")
    end
  end
end
