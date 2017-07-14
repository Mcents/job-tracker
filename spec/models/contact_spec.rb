require 'rails_helper'

RSpec.describe Contact, type: :model do
  describe "attributes" do
    it "has a name, email, and title" do
      contact = build(:contact)
      expect(contact).to respond_to(:name)
      expect(contact).to respond_to(:email)
      expect(contact).to respond_to(:title)
    end
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name)}
    it { is_expected.to validate_presence_of(:email)}
    it { is_expected.to validate_uniqueness_of(:email)}
    it { is_expected.to validate_presence_of(:title)}
  end
end
