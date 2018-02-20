require 'rails_helper'

describe 'User can login' do
  before :each do
    @password = '1234'
    @user = create(:user, password: @password)
  end
  
  scenario "A registered user can login" do
    visit login_path

      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @password
      click_button('Log in')

      expect(current_path).to eq(root_path)
      
      
  end
  scenario "A non registerd user can't login" do
    visit login_path

      fill_in "user[email]", with: 'bad@email.com'
      fill_in "user[password]", with: @password
      click_button('Log in')

      expect(page).to have_content('Invalid Email or password')
      
      
  end
  
end