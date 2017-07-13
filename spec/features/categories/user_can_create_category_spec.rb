require 'rails_helper'

RSpec.feature "User creates a new category" do
  scenario "a user can create a new category" do

    title = "Education"

    visit new_category_path
    fill_in "category[title]", with: title
    click_button "Create Category"

    expect(page).to have_content("Education")
    expect(current_path).to eq("/categories/#{category.first.id}")
  end
end
