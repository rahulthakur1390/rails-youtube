require 'rails_helper'

RSpec.describe Movie, :type => :model do
  let(:movie) { create(:movie) }
  
  subject { described_class.new(url: "https://www.youtube.com/watch?v=fIip0BH6z7I") }

  it "has a valid factory" do
    expect(build(:movie)).to be_valid
  end

  it "should have many likes" do
    association = Movie.reflect_on_association(:likes)
    expect(association.macro).to eq(:has_many)
  end

  describe "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a password" do
      subject.url = nil
      expect(subject).to_not be_valid
    end
  end
end
