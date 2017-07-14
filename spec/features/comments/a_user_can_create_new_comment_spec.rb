require 'rails_helper'

RSpec.feature "User creates a new comment" do
  scenario "a user can create a new comment" do
    category = create(:category, title: "Education")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    notes = "Hiring manager was a gem"

    visit companies_path
    click_on "ESPN"
    click_on "Developer"
    fill_in "comment[notes]", with: notes
    click_button "Create Comment"

    expect(page).to have_content "Hiring manager was a gem"
    expect(page).to have_content "less than a minute ago"
  end
end
