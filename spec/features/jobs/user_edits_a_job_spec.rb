require 'rails_helper'

RSpec.feature "User edits an existing job" do
  scenario "they see the updated data for the individual job" do
    company = Company.create(name: "Johnson & Johnson")
    job = Job.create(title: "Basket Weaver", level_of_interest: 4, company_id: company.id, city: "San Jose")
    updated_title = "Master BW"

    visit companies_path
    click_on "Johnson & Johnson"
    click_on "Basket Weaver"
    click_on "Edit Job"
    fill_in "job_title", with: updated_title
    click_on "Update"

    expect(page).to have_content(updated_title)
    expect(page).to_not have_content(job.title)
  end
end
