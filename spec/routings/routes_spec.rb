require 'rails_helper'

RSpec.describe "routes for iDrive ", type: :routing do
	context "Authentication Controller" do
		it "routes /authentication" do
	    expect(post("/authentication")).to route_to(:format=>:json,:controller => "authentication", :action => "login")
	  end
	end
	context "User Controller" do
	  it "routes /create" do
	    expect(post("/create")).to route_to(:format=>:json,:controller => "users", :action => "create")
	  end
	end
	context "Todos Controller" do
	  it "routes /tods" do
	    expect(get("/todos")).to route_to(:format=>:json,:controller => "todos", :action => "todos")
	  end
	end
end