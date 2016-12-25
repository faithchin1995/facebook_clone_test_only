require 'rails_helper'

RSpec.feature "Session", :type => :feature do 
	scenario "Logging in" do
		visit '/sessions/new'
		expect(page).to have_text("Password")
	end

	scenario "Fill Up Form" do
		User.create!({name: "Faith", email: "faith@gmail.com", password: "123456", password_confirmation: "123456"})
		visit "/sessions/new"
		fill_in "Email", :with => "faith@gmail.com"
		fill_in "Password", :with => "123456"
		click_button "Login"
		expect(current_path).to eq "/sessions/new"
	end

end