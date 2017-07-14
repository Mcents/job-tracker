require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  describe "GET #index" do
    it "assigns all categories as @categories and renders the index template" do
      category = create(:category)

      get(:index)

      expect(assigns(:category)).to eq([category])
      expect(response).to render_template("index")
    end
  end

  describe "GET #show" do
    it "assigns the requested category as @category and render the show template" do
      category = create(:category)
      get(:show, params: {id: category.id})

      expect(assigns(:category)).to eq(category)
      expect(response).to render_template("show")
    end
  end
end
