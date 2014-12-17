class Standup < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :reject_if => :all_blank, :allow_destroy => true
  validates_presence_of :title
  validate :user_quota, :on => :create 

  scope :newest_first, -> { order('created_at DESC') }

  def find_previous
    user.standups.where("(id < ?)", id).last
  end

  private 

  def user_quota
    if user.standups.today.count >= 1
      errors.add(:base, "Exceeds daily limit")
    end
  end
end
