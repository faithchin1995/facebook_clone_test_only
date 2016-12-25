require 'rails_helper'

RSpec.feature "Welcome", :type => feature do 
	scenario "Visit Home Page" do
		visit "/welcome"
		click_link "Home"
		expect(current_path).to eq "/"
	end	

	scenario "Logging Out" do
		visit "/welcome"
		click_link "Log Out"
		expect(current_path).to eq "/sessions/destroy"
	end
end