require 'spec_helper'

feature 'Share a movie' do
  it "should see share a movie button" do
    login_as create( :user ), scope: :user
    visit root_path
    expect(page).to have_content('Share a movie')
  end

  it "should not see share a movie button" do
    visit root_path
    expect(page).not_to have_content('Share a movie')
  end
end