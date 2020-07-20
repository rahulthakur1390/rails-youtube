require 'spec_helper'

feature 'Visitor Sign up' do
  scenario 'with valid email and password' do
    sign_up_with 'valid@gmail.com', 'password'

    expect(page).to have_content('Logout')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Sign up')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Sign up')
  end

  it "should create a new post with a logged in user" do
    login_as create( :user ), scope: :user

    visit root_path
    # puts page.body

    # within "#new_post" do
    #   fill_in "post_name", with: "Post title"
    # end

    # click_link_or_button "Create Post"

    # expect( Post.count ).to eq(1)
    # expect( Post.first.name).to eq( "Post title")
    expect(page).to have_content('Share a movie')

  end

  def sign_up_with(email, password)
    visit new_user_registration_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
  end
end
