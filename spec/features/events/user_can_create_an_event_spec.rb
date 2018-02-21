require 'rails_helper'
describe 'Event creation' do
  scenario 'user is logged in and can create event' do
    @password = '1234'
    @user = create(:user, password: @password)
    login_as :user, @user
    visit new_event_path
    page.execute_script("$('input#date').datepicker('setDate', '01/01/2020')")
    fill_in 'event[name]', with: 'test wedding'
    fill_in 'event[description]', with: 'test wedding description'
    fill_in 'event[capacity]', with: '100'
  end
  
  scenario 'user is not logged in and can\' create event' do
    visit new_event_path
    expect(page).to have_content('must be logged in')
  end
end