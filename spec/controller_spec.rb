require 'spec_helper'

describe "Controller" do
  let(:valid_params) { { email: Faker::Internet.email, password: Faker::Internet.password } }
  # let(:invalid_params) { { email: ??, password: ?? } }

  describe "GET/login" do

    context "if no errors stored in session" do

      before do
        # @user = User.create(valid_params)
        get '/login'
      end

      it "has http status code of 200" do
        expect(last_response.status).to eq(200)
      end

      it "renders the login page" do
        expect(last_response.body).to include("<p>If you don't have an account then sign up.</p>")
      end
    end

    context "if errors in session" do

      before do
        get '/login', {}, "rack.session" => {:errors => "meowmeow"}
      end

      it "has http status code of 200" do
        expect(last_response.status).to eq(200)
      end

      it "renders the login page" do
        expect(last_response.body).to include("<p>If you don't have an account then sign up.</p>")
      end

      it "renders an error message on the page" do
        expect(last_response.body).to include("meowmeow")
      end

      it "clears the session of errors" do
        expect(session[:errors]).to be_nil
      end





    end
  end
end








