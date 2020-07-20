require 'spec_helper'

feature 'Visitor Log in' do
  scenario 'with valid email and password' do
    user = create(:user)
    sign_up_with user.email, user.password

    expect(page).to have_content('Logout')
  end

  scenario 'with invalid email' do
    sign_up_with 'invalid_email', 'password'

    expect(page).to have_content('Log in')
  end

  scenario 'with blank password' do
    sign_up_with 'valid@example.com', ''

    expect(page).to have_content('Log in')
  end

  def sign_up_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end
