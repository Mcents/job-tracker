require 'rails_helper'

RSpec.feature "User edits an existing job" do
  scenario "they see the updated data for the individual job" do
    Company.create(name: "Johnson & Johnson")
    job = Job.create(title: "Basket Weaver", description: "Weaving baskets with your toes", level_of_interest: 4, city: "San Jose", company_id: 1)
    updated_title = "Master BW"

    visit '/companies/1/jobs/1'
    click_on("Edit")
    fill_in "job_name", with: updated_title
    click_on "Update job"

    expect(page).to have_content(updated_title)
    expect(page).to_not have_content(job.title)
  end
end
