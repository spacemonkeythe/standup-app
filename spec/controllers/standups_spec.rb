require "rails_helper"

RSpec.describe StandupsController, :type => :controller do

    describe "GET index" do

        before do
            @standup1 = mock_model(Standup)
            @standup2 = mock_model(Standup)

            @standups = [@standup1, @standup2]
            allow(Standup).to receive_message_chain(:newest_first, :paginate) { @standups }

            user = double(User)
            allow(request.env["warden"]).to receive(:authenticate!) { user }
            allow(controller).to receive(:current_user) { user }
        end


        it "returns http success" do
            get :index
            expect(response).to have_http_status(:success)
        end

        it "renders the index template" do
            get :index
            expect(response).to render_template("index")
        end

        it "outputs all standups" do
            get :index
            expect(assigns(:standups)).to eql(@standups)
        end   

    end

    describe "GET new_standup" do

        before do
            @standup = mock_model(Standup)
            standups = double("standups", :build => @standup)

            user = double(User, :standups => standups)
            allow(request.env["warden"]).to receive(:authenticate!) { user }
            allow(controller).to receive(:current_user) { user }
        end

         it "returns http success" do
            get :new
            expect(response).to have_http_status(:success)
        end

        it "renders the new template" do
            get :new
            expect(response).to render_template("new")
        end

        it "prepares for saving new standup" do
            get :new
            expect(assigns(:standup)).to eql(@standup)
        end

    end

end

