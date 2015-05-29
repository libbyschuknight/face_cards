require 'spec_helper'

describe "Controller" do
  let(:valid_params) { { email: Faker::Internet.email, password: Faker::Internet.password } }
  let(:invalid_params) { { email: " ", password: " " } }

  describe "GET/login" do

    context "if no errors stored in session" do

      before do
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

  describe "POST/login" do

    context "if valid request" do

      before do
        @user = User.create(valid_params)
        post '/login', valid_params
      end

      it "returns http status code of 302" do
        expect(last_response.status).to eq(302)
      end

      it "redirects user to index page" do
        full_url = last_response.original_headers["Location"]
        expect(URI(full_url).path).to eq('/')
      end

      it "creates an item in the database" do
        expect(User.find_by(email: valid_params[:email])).to be_truthy
      end
    end
    User.destroy_all
  end


  describe "GET/sign_up" do

    context "if no errors stored in session" do

      before do
        get '/sign_up'
      end

      it "has http status code of 200" do
        expect(last_response.status).to eq(200)
      end

      it "renders the sign up page" do
        expect(last_response.body).to include("<title>EDA Face Cards - Sign Up</title>")
      end
    end
  end

  describe "POST/sign_up" do

   context "if invalid request" do

      before do
        @user = User.create(invalid_params)
        post '/sign_up', invalid_params
      end

      it "returns http status code of 200" do
        expect(last_response.status).to eq(200)
      end

      it "does not create an user in the database" do
        expect(User.find_by(email: invalid_params[:email])).to be_nil
      end

      it "displays error message on invalid credentials" do
        full_url = last_response.original_headers["Location"]
        expect(last_response.body).to include("Sorry, those are invalid credentials.")
      end

    end
    User.destroy_all
  end
end








