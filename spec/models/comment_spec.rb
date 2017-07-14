require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "attributes" do
    it "has notes" do
      comment = build(:comment)
      expect(comment).to respond_to(:notes)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:notes)}
  end

  describe "relationships" do
    it { should belong_to(:job) }
  end
end
