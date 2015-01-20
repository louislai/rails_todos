require 'spec_helper'

describe "Creating a new account" do 
  it "redirect to user page on success" do
    visit "/signup"
    fill_in "Email", with: "a@a.com"
    fill_in "First name", with: "test"
    fill_in "Last name", with: "test"
    fill_in "Password", with: "password"
    fill_in "Password", with: "password"
    click_button "Create my account"

    expect(page).to have_content("Your account has been created successfully!")
  end
end