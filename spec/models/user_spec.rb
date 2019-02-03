require 'rails_helper'
require 'spec_helper'


RSpec.describe User, type: :model do
	let(:user){create(:create_user)}
	
	describe "Model valid object" do
	  	context "Fail" do 
		  	it "has a invalid factory" do
		  		expect(build(:create_user,email: nil).valid?).to eq(false)
		  	end
		  	it "has a invalid factory" do
		  		expect(build(:create_user,first_name: nil).valid?).to eq(false)
		  	end
		  	it "has a invalid factory" do
		  		expect(build(:create_user,last_name: nil).valid?).to eq(false)
		  	end
		  	it "has a invalid factory" do
		  		expect(build(:create_user,email: "r@").valid?).to eq(false)
		  	end
	  	end
	  	
	  	context "Success" do 
	  		it "has a valid factory" do
		    	expect(build(:create_user)).to be_valid
		  	end
	  	end
  	end
end