require 'rails_helper'

RSpec.feature "User sees all categories" do
  scenario "they can see all cateogries" do
    cat  = create(:category)
    cat2 = create(:category)
    cat3 = create(:category)

    visit categories_path

    expect(page).to have_content(cat.title)
    expect(page).to have_content(cat.title)
    expect(page).to have_content(cat.title)
  end
end
