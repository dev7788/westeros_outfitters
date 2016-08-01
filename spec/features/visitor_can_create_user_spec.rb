require 'rails_helper'

RSpec.feature 'Visitor can create a user' do
  scenario 'they can create a user account' do
    visit new_user_path

    fill_in 'Username', with: 'matt'
    fill_in 'Password', with: 'campbell'
    fill_in 'Email', with: 'RRBean'
    fill_in 'Address', with: 'that one place'
    click_button 'Submit'

    expect(page).to have_content('Hello, matt.')
    expect(page).to have_content('Account Successfully Created!')
  end
end
