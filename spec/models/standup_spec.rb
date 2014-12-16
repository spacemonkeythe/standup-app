require "rails_helper"

RSpec.describe Standup, :type => :model do

  
  #let(:standup) { FactoryGirl.create(:standup) }

  it { is_expected.to have_db_column(:title).of_type(:string) }
  it { is_expected.to have_db_column(:content).of_type(:string) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:user_id).of_type(:integer) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:tasks).dependent(:destroy) }

  it { should accept_nested_attributes_for(:tasks) }#.but_reject(:all_blank).allow_destroy(true) }
  #it { should accept_nested_attributes_for(:association_name).but_reject({ :val_1 => "", :val_2 => "" }) }

  let(:user)    { User.create!(:email => "test@test.com", :password => "test123456") }
  let(:standup) { user.standups.create!(:title => "Title", :content => "content") }
  
  subject { standup }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate(:user_quota).on(:create) }



#describe "#find_previous" do

  #it "should not return nil" do
   #   standup = Standup.new
  #    expect(standup).not_to be_nil 
 # end
#end



end