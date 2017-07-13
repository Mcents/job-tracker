require 'rails_helper'

RSpec.feature "User deletes an existing job" do
  scenario "they are redirected to the company page and no long see the job" do
    company = Company.create(name: "Johnson & Johnson")
    job = Job.create(title: "Basket Weaver", level_of_interest: 4, company_id: company.id, city: "San Jose")

    visit companies_path
    click_on "Johnson & Johnson"
    click_on "Basket Weaver"
    click_on "Delete Job"

    expect(page).to_not have_content "Basket Weaver"
  end
end
