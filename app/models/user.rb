class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 
  mount_uploader :image, ImageUploader

  has_many :comments

  has_many :standups  do
    def today
        where(:created_at => (Time.now.beginning_of_day..Time.now))
    end
  end

end
