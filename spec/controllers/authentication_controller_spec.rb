require 'rails_helper'
require 'spec_helper' 

RSpec.describe AuthenticationController, type: :controller do

 
  let(:user){create(:create_user)}
  let(:json){JSON.parse(response.body)}
 
  describe "POST CALL" do 
    before(:each) do
       user # creating user by calling let variable      
    end
    #on login JWT create token and forwarded as auth_token
    it "User login with proper credentials" do 
      post :login, :params => {email: "tester@mailinator.com",password: "12345678"}
      expect(response).to have_http_status(:ok)
      expect(json["success"]).to eq(true)
      expect(json["auth_token"].present?).to eq(true)
      expect(json["user"]["email"]).to eq("tester@mailinator.com")
    end
    it "User login with wrong password credentials" do 
      post :login, :params => {email: "tester@mailinator.com",password: "123245678"}
      expect(response).to have_http_status(400)
      expect(json["success"]).to eq(false)
      expect(json["message"].include?("Invalid credentials.")).to eq(true)
    end
    it "User login with new email credentials" do 
      post :login, :params => {email: "new_email@mailinator.com",password: "123245678"}
      expect(response).to have_http_status(400)
      expect(json["success"]).to eq(false)
      expect(json["message"].include?("Email Not Registered with us.")).to eq(true)
    end
  end
end