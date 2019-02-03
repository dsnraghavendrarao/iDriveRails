require 'rails_helper'
require 'spec_helper' 

RSpec.describe TodosController, type: :controller do

 
  let(:user){create(:create_user)}
  let(:json){JSON.parse(response.body)}
 
  describe "POST CALL" do 
    before(:each) do
      user # creating user by calling let variable     
      @auth_token = JsonWebToken.encode(user_id: user.id)  
      request.headers["HTTP_AUTHORIZATION"] = @auth_token
    end
    
    it "Getting todo's list only if authentication success" do 
      get :todos 
      expect(response).to have_http_status(:ok)
      expect(json["success"]).to eq(true)
      expect(json["todos"].present?).to eq(true) 
    end
    it "Getting todo's list only if authentication fail" do 
      request.headers["HTTP_AUTHORIZATION"] = "Test Token"
      get :todos 
      expect(response).to have_http_status(:unauthorized)
      expect(json["success"]).to eq(false)
    end
  end
end