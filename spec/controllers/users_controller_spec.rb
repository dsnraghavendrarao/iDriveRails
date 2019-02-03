require 'rails_helper'
require 'spec_helper' 

RSpec.describe UsersController, type: :controller do

 
  let(:user){create(:create_user)}
  let(:json){JSON.parse(response.body)}
 
  describe "POST Create " do 
    it 'User creation with success status' do
      post :create, :params => {user: attributes_for(:create_user)}
      expect(response).to have_http_status(:created)
      expect(json["success"]).to eq(true)
    end
    it "User creation with success fail status" do 
      post :create, :params => {user: attributes_for(:user_with_out_first_name)}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json["success"]).to eq(false)
      expect(response["error"].present?)
    end
    it "User creation with success fail status - Uniq email " do 
      user # creating user by calling let variable
      post :create, :params => {user: attributes_for(:user_with_out_first_name)}
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json["success"]).to eq(false)
      expect(response["error"].present?)
    end
  end
end