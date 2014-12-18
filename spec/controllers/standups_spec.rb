require "rails_helper"

RSpec.describe Standup, :type => :controller do

    describe "GET /standups" do

      it "displays standups" do
        visit standups_path
        #expect(response).to redirect_to(standups_path)
      end

    end

end