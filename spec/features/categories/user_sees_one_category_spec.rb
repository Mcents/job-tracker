require 'rails_helper'

RSpec.feature "User sees an individual category" do
  scenario "they can see an individual category" do
    category = create(:category, title: "Education")

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Education")
  end

  scenario "they see a list of jobs in that category" do
    category = create(:category, title: "Education")
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job2 = company.jobs.create!(title: "Marketer", level_of_interest: 60, city: "Denver", category_id: category.id)

    visit category_path(category)

    expect(page).to have_content("Developer")
    expect(page).to have_content("Marketer")
  end
end
