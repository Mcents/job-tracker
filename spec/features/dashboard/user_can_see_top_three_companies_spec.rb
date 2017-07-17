require 'rails_helper'

describe "average level of interest" do
  it "can pull top three companies by average level of interest" do
    bonobos = Company.create(name: "Bonobos")
    casper = Company.create(name: "Casper")
    blue_apron = Company.create(name: "Blue Apron")

    job_one = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 10, company_id: bonobos.id, city: "NYC")
    job_two = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 5, company_id: bonobos.id, city: "NYC")
    job_three = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 10, company_id: casper.id, city: "NYC")
    job_four = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 2, company_id: casper.id, city: "NYC")
    job_five = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 5, company_id: blue_apron.id, city: "NYC")
    job_six = Job.create(title: "Wed Dev", description: "Ruby", level_of_interest: 6, company_id: blue_apron.id, city: "NYC")


    visit dashboard_index_path

    expect(page).to have_content "Top three companies by level of interest"
    expect(page).to have_content "Bonobos's jobs have a 7.5 average level of Interest"
    expect(page).to have_content "Casper's jobs have a 6.0 average level of Interest"
    expect(page).to have_content  "Blue Apron's jobs have a 5.5 average level of Interest"

  end
end
