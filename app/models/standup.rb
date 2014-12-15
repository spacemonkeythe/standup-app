class Standup < ActiveRecord::Base
  belongs_to :user
  has_many :tasks
  accepts_nested_attributes_for :tasks, :reject_if => :all_blank, :allow_destroy => true
  validates_presence_of :title
  validate :user_quota, :on => :create 

  scope :newest_first, -> { order('created_at DESC') }

  def find_previous
    Standup.where("(id < ?) AND (user_id = ?)", id, user.id).last
  end

  private 

    def user_quota
      if user.standups.today.count >= 1
        errors.add(:base, "Exceeds daily limit")
      end
    end

  end
