require 'rails_helper'

RSpec.feature "User creates a new contact" do
  scenario "a user can create a new contact" do
    company = Company.create!(name: "ESPN")

    visit companies_path
    click_on "ESPN"
    fill_in "contact[name]", with: "Michael Centrelli"
    fill_in "contact[email]", with: "acentrelli@gmail.com"
    fill_in "contact[title]", with: "Software Developer"

    click_on "Create Contact"

    expect(page).to have_content "ESPN"
    expect(page).to have_content "Michael Centrelli"
    expect(page).to have_content "acentrelli@gmail.com"
    expect(page).to have_content "Software Developer"
  end
end
