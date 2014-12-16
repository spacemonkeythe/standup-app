require 'rails_helper'

describe Standup, :type => :model do

  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }



  describe "#find_previous" do

    it "should not return nil" do
      standup = Standup.new
      expect(standup).not_to be_nil 
    end

  end

end