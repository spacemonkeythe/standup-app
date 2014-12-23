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

    before do
      @comment = Comment.new
      @standup = mock_model(Standup, :id => 1 )
      
      @params = {:body => "test"}
      
      user = User.create!(:email => "test10@gmail.com", :password => "test123456")
      sign_in(user)

      allow(Standup).to receive(:find) { @standup }
      allow(@standup).to receive_message_chain(:comments, :build) { @comment }
    end

    it "saves the comment" do
      expect(@comment).to receive(:save)
      post :create, :comment => @params, :standup_id => 1
    end

    context "saving comment in the database is OK" do

      before do
        allow(@comment).to receive(:save) { true }
      end

      it "redirects to @standup" do
        post :create, :comment => @params, :standup_id => 1
        expect(response).to redirect_to(@standup)
      end

    end

    context "saving comment in the database is not OK" do
      before do
        allow(@comment).to receive(:save) { false }
      end

      it "redirects to 'new' template" do
        post :create, :comment => @params, :standup_id => 1
        expect(response).to render_template("new")
      end
      
    end
  end

end
