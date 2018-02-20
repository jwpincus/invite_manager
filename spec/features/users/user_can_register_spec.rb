require 'rails_helper'

describe 'User registrations' do
  scenario 'a new user can register' do
    visit register_path
    fill_in 'user[email]', with: 'test@email.com'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    fill_in 'user[first_name]', with: 'name'
    fill_in 'user[last_name]', with: 'last'
    click_button('Sign up')
    user = User.last
    expect(user.email).to eq('test@email.com')
    expect(user.first_name).to eq('name')
    expect(user.last_name).to eq('last')
  end
  
  scenario 'an existing user can\'t re-register' do
    visit register_path
    password = '1234'
    user = create(:user, password: password)
    fill_in "user[email]", with: user.email
    fill_in "user[password]", with: '1234'
    fill_in 'user[password_confirmation]', with: '1234'
    click_button('Sign up')
    expect(page).to have_content("already been taken")
  end
end