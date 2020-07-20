require 'rails_helper'

describe User, :type => :model do

  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end
  end

  it "should have many likes" do
    association = User.reflect_on_association(:likes)
    expect(association.macro).to eq(:has_many)
  end

  subject { described_class.new(email: "john@doe.com", password: "some_password") }

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end
  end
end
