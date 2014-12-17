require "rails_helper"

RSpec.describe Standup, :type => :model do

  it { is_expected.to have_db_column(:title).of_type(:string) }
  it { is_expected.to have_db_column(:content).of_type(:string) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:user_id).of_type(:integer) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:tasks).dependent(:destroy) }

  it { should accept_nested_attributes_for(:tasks) }#.but_reject(:all_blank).allow_destroy(true) }

  let(:user)    { User.create!(:email => "test@test.com", :password => "test123456") }
  let(:standup) { user.standups.create!(:title => "Title", :content => "content") }
  
  subject { standup }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to be_valid(:user_quota) }#.on(:create) }

  describe "scopes" do
    describe "#newest_first" do

      before do
        @user1 = User.create!(:email => "test1@test.com", :password => "test123456")
        @user2 = User.create!(:email => "test11@test.com", :password => "test123456")
        @standup1 = Standup.create!(:title => "Title1", :content => "content1", :user => @user1)
        Timecop.travel(2.seconds.from_now) { @standup2 = Standup.create!(:title => "Title2", :content => "content2", :user => @user2) }
      end

      it "orders standups by time created, descending" dos
        expect(Standup.newest_first[0]).to eql(Standup.last)
      end

    end
  end

describe "#find_previous" do

  before do
    @user1 = User.create!(:email => "test10@gmail.com", :password => "test123456")
    @standup1 = Standup.create!(:title => "Title3", :content => "content3", :user => @user1)
    Timecop.travel(24.hours.from_now) { @standup2 = Standup.create!(:title => "Title2", :content => "content2", :user => @user1) }
  end

  it "should find previous standup" do
    expect(@standup2.find_previous).to eql(@standup1)
  end
end


describe "user_quota" do

  before do
    @user1 = User.create!(:email => "test10@gmail.com", :password => "test123456")
    @standup1 = Standup.create!(:title => "Title3", :content => "content3", :user => @user1)
    @standup2 = Standup.new(:title => "Title2", :content => "content2", :user => @user1)
  end

  it "should not permit standup posting" do
    expect(@standup2).to_not be_valid
    expect(@standup2.errors.full_messages).to eql(["Exceeds daily limit"])
  end
end


end