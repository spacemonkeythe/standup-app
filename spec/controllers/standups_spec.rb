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

    describe "GET show_standup" do

        before do
            @standup = double(Standup, :id => 2)
            @prev_standup = double(Standup, :id => 1)
            standups = double("standups", :build => @standup)


            allow(Standup).to receive(:find) { @standup }

            allow(@standup).to receive(:find_previous) { @prev_standup }

            user = double(User, :standups => standups)
            allow(request.env["warden"]).to receive(:authenticate!) { user }
            allow(controller).to receive(:current_user) { user }
        end

         it "returns http success" do
            get :show, :id => 1
            expect(response).to have_http_status(:success)
        end

        it "renders the show template" do
            get :show, :id => 1
            expect(response).to render_template("show")
        end

        it "prepares for saving new standup" do
            get :show, :id => 1
            expect(assigns(:prev)).to eql(@prev_standup)
        end

    end

    describe "GET edit_standups" do

        before do
            @standup = double(Standup, :id => 1)
            standups = double("standups", :build => @standup)

            allow(Standup).to receive(:find) { @standup }

            user = double(User, :standups => standups)
            allow(request.env["warden"]).to receive(:authenticate!) { user }
            allow(controller).to receive(:current_user) { user }

            allow(user).to receive_message_chain(:standups, :find_by) { @standup }
        end

        it "returns http success" do
            get :edit, :id => 1
            expect(response).to have_http_status(:success)
        end

        it "renders the show template" do
            get :edit, :id => 1
            expect(response).to render_template("edit")
        end

        ####################################
    end

       describe "POST standup_create" do

        before do
            @standup = mock_model(Standup)
            standups = double("standups", :build => @standup)
            @params = {:title => "title", :content => "content", 
                :task_attributes => {:id => 1, :content => "contetnt", :done => false, :_destroy => "destroy"}}

            allow(@standup).to receive(:save) { true }


            user = double(User, :standups => standups)
            allow(request.env["warden"]).to receive(:authenticate!) { user }
            allow(controller).to receive(:current_user) { user }
        end

         it "POST saves the standup params" do
            post :create, :standup => @params
        end

    end

    describe "POST standup_update" do

        before do
            @standup = mock_model(Standup, :id => 1)
            standups = double("standups", :build => @standup)
            @params = {:title => "title", :content => "content", 
                :task_attributes => {:id => 1, :content => "contetnt", :done => false, :_destroy => "destroy"}}

            allow(Standup).to receive(:find) { @standup }

            allow(@standup).to receive(:update)


            user = double(User, :standups => standups)
            allow(request.env["warden"]).to receive(:authenticate!) { user }
            allow(controller).to receive(:current_user) { user }

            allow(user).to receive_message_chain(:standups, :find_by) { @standup }
        end

         it "POST saves the standup params" do
            post :update, :id => 1, :standup => @params
        end
        
    end

end

