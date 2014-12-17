require "rails_helper"

RSpec.describe Task, :type => :model do

  it { is_expected.to have_db_column(:content).of_type(:string) }
  it { is_expected.to have_db_column(:done).of_type(:boolean) }
  it { is_expected.to have_db_column(:standup_id).of_type(:integer) }
  it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }

  it { is_expected.to belong_to(:standup).dependent(:destroy) }

end
