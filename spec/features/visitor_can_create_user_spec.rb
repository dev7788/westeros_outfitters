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

  scenario "they can't create an account with missing info" do
    visit new_user_path

    fill_in 'Username', with: 'nope'
    click_button 'Submit'

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content('Those Are Not Valid Inputs. Please Try Again.')
  end
end
