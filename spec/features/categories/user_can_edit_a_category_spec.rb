require 'rails_helper'

RSpec.feature "User edits an existing job" do
  scenario "they see the updated data for the individual job" do
    category = Category.create(title: "Science")
    updated_category = "Education"

    visit categories_path
    click_on "Edit"
    fill_in "category_title", with: updated_category
    click_on "Update"

    expect(page).to have_content(updated_category)
  end
end
