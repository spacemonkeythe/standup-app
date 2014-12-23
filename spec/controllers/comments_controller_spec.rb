require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  describe "GET new" do

    before do
      @comment = mock_model(Comment)

      user = User.create!(:email => "test10@gmail.com", :password => "test123456")

      sign_in(user)
      allow(Comment).to receive(:new) { @comment }
    end

    it "returns http success" do 
      get :new, {:standup_id => 1}
      expect(response).to have_http_status(:success)
    end

    it "renders the index template" do
      get :new, {:standup_id => 1}
      expect(response).to render_template("new")
    end

    it "prepares for saving new standup" do
      get :new, {:standup_id => 1}
      expect(assigns(:comment)).to eql(@comment)

    end

  end

  describe "POST create" do

    context "saving comment in the database is OK" do
      before do
        @comment = mock_model(Comment)
        @standup = mock_model(Standup, :id => 1 )
        
        @params = {:body => "test"}
        
        user = User.create!(:email => "test10@gmail.com", :password => "test123456")
        sign_in(user)

        allow(Standup).to receive(:find) { @standup }
        allow(@standup).to receive_message_chain(:comments, :create) { @comment }
        allow(@comment).to receive(:save) { true }

      end

      it " try to save the comment" do
        post :create, :comment => @params, :standup_id => 1
      end
    end

    context "saving comment in the database is not OK" do
      before do
        @comment = mock_model(Comment)
        @standup = mock_model(Standup, :id => 1 )
        
        @params = { :body => "test" }
        
        user = User.create!(:email => "test10@gmail.com", :password => "test123456")
        sign_in(user)

        allow(Standup).to receive(:find) { @standup }
        allow(@standup).to receive_message_chain(:comments, :create) { @comment }
        allow(@comment).to receive(:save) { false }

      end

      it "try to saves the comment" do
        post :create, :comment => @params, :standup_id => 1 
      end
      
    end
  end

end
