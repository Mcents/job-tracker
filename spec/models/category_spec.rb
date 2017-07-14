require 'rails_helper'

RSpec.describe Category do
  describe "attributes" do
    it "has a title" do
      category = build(:category)
      expect(category).to respond_to(:title)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_uniqueness_of(:title) }
  end

  describe "relationships" do
    it { should have_many(:jobs) }
  end

end
