require 'rails_helper'

RSpec.feature "User deletes an existing category" do
  scenario "a user can delete a category" do
    category = create(:category, title: "Science")
    category2 = create(:category, title: "Education")
    visit categories_path
    first(:link, "Delete").click

    expect(page).to_not have_content "Science"
    expect(page).to have_content "Education"
  end
end
