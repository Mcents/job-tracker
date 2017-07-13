require 'rails_helper'

RSpec.feature "User edits an existing job" do
  scenario "they see the updated data for the individual job" do
    job = Job.create(title: "Basket Weaver", description: "Weaving baskets with your toes", level_of_interest: 4, city: "San Jose", company_id: 2)
    updated_title = "Master BW"

    visit job_path(job)
    click_on("Edit")
    fill_in "job_name", with: updated_title
    click_on "Update job"

    expect(page).to have_content(updated_title)
    expect(page).to_not have_content(job.title)
  end
end
