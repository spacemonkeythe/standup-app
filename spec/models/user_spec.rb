require "rails_helper"

  RSpec.describe User, :type => :model do

    #devise columns
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:username).of_type(:string) }
    it { is_expected.to have_db_column(:image).of_type(:string) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:sign_in_count).of_type(:integer) }
    it { is_expected.to have_db_column(:current_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:last_sign_in_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:current_sign_in_ip).of_type(:inet) }
    it { is_expected.to have_db_column(:last_sign_in_ip).of_type(:inet) }

    it { is_expected.to have_many(:standups) }

    describe "#today" do

      before do
        @user1 = User.create!(:email => "test10@gmail.com", :password => "test123456")
        @standup1 = Standup.create!(:title => "Title3", :content => "content3", :user => @user1)
      end
      

      it "should find todays standups" do 
        expect(@user1.standups.today[0]).to eql(@standup1) 
      end

    end
end
