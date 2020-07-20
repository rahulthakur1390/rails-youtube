require 'rails_helper'

RSpec.describe Like, :type => :model do
  it "should belongs_to movie" do
    association = Like.reflect_on_association(:movie)
    expect(association.macro).to eq(:belongs_to)
  end

  it "should belongs_to user" do
    association = Like.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end
end
