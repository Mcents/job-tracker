require 'rails_helper'

RSpec.feature "User sees count of jobs by interest level" do
  scenario "and they can really see them" do
    espn = Company.create(name: "Espn")
    apple = Company.create(name: "Apple")
    home_chef = Company.create(name: "Home Chef")

    Job.create(title: "Wed Dev", level_of_interest: 10, company_id: espn.id, city: "New York")
    Job.create(title: "Wed Dev", level_of_interest: 5, company_id: espn.id, city: "New York")
    Job.create(title: "Wed Dev", level_of_interest: 10, company_id: apple.id, city: "New York")
    Job.create(title: "Wed Dev", level_of_interest: 2, company_id: apple.id, city: "New York")
    Job.create(title: "Wed Dev", level_of_interest: 5, company_id: home_chef.id, city: "New York")
    Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 6, company_id: home_chef.id, city: "New York")


    visit dashboard_index_path


    expect(page).to have_content "2 Job(s) with a level of interest of 5"
    expect(page).to have_content "2 Job(s) with a level of interest of 10"
    expect(page).to have_content "1 Job(s) with a level of interest of 6"
    expect(page).to have_content "1 Job(s) with a level of interest of 2"
  end
end
