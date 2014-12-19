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

        context "paramters for edit are ok" do
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
        end

        context "parameters for edit are not OK" do
            before do
                @standup = double(Standup, :id => 1)
                standups = double("standups", :build => @standup)

                allow(Standup).to receive(:find) { @standup }

                user = double(User, :standups => standups)
                allow(request.env["warden"]).to receive(:authenticate!) { user }
                allow(controller).to receive(:current_user) { user }

                allow(user).to receive_message_chain(:standups, :find_by) { @standup2 }
            end

            it "displays the notice" do
                get :edit, :id => 1
                expect(flash[:notice]).to eql("Not authorized to edit this standup")
            end
        end
    end

       describe "POST standup_create" do

        before do
            @standup = mock_model(Standup)
            standups = double("standups", :build => @standup)
            @params = {:title => nil, :content => nil, 
                :task_attributes => {:id => nil, :content => nil, :done => false, :_destroy => nil}}

            allow(@standup).to receive(:save) { true }

            user = double(User, :standups => standups)
            allow(request.env["warden"]).to receive(:authenticate!) { user }
            allow(controller).to receive(:current_user) { user }
        end

         it "POST saves the standup params" do
            post :create, :standup => @params
            #expect(response).to have_http_status(:success)
        end
    end

    describe "POST standup_update" do

        context "parameters for update are ok" do
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

        context "parameters for update are not ok" do
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

                allow(user).to receive_message_chain(:standups, :find_by) { @standup2 }
            end

            it "displays the notice" do
                get :edit, :id => 1
                expect(flash[:notice]).to eql("Not authorized to edit this standup")
            end
        end


    end

       describe "DELETE standup_destroy" do

        context "parameters for destroy are ok" do
            before do
                @standup = mock_model(Standup, :id => 1)
                standups = double("standups", :build => @standup)

                allow(Standup).to receive(:find) { @standup }
                allow(@standup).to receive(:update)

                user = double(User, :standups => standups)
                allow(request.env["warden"]).to receive(:authenticate!) { user }
                allow(controller).to receive(:current_user) { user }

                allow(user).to receive_message_chain(:standups, :find_by) { @standup }
                allow(@standup).to receive(:destroy) { true }
            end

             it " deletes the standup from the database" do
                post :destroy, :id => 1
            end
        end
        
        context "parameters for destroy are not ok" do
            before do
                @standup = mock_model(Standup, :id => 1)
                standups = double("standups", :build => @standup)

                allow(Standup).to receive(:find) { @standup }
                allow(@standup).to receive(:update)

                user = double(User, :standups => standups)
                allow(request.env["warden"]).to receive(:authenticate!) { user }
                allow(controller).to receive(:current_user) { user }

                allow(user).to receive_message_chain(:standups, :find_by) { @standup2 }
                allow(@standup).to receive(:destroy) { true }
            end

            it "displays the notice" do
                get :edit, :id => 1
                expect(flash[:notice]).to eql("Not authorized to edit this standup")
            end
        end
    end

end

