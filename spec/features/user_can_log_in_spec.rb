require 'rails_helper'

RSpec.feature 'User can log in' do
  scenario "they can log in with the proper credentials" do
    User.create!(username: 'garrett', password: 'test', address: 'user street', email: 'user.com', role: 0)

    visit login_path

    fill_in 'Username', with: 'garrett'
    fill_in 'Password', with: 'test'
    click_button 'Login'

    expect(current_path).to eq(user_path)
    expect(page).to have_content('Hello, garrett.')
  end

  scenario "they cannot log in without proper credentials" do
    User.create!(username: 'garrett', password: 'test', address: 'user street', email: 'user.com', role: 0)

    visit login_path

    fill_in 'Username', with: 'garrett'
    fill_in 'Password', with: 'oihujgv'
    click_button 'Login'

    expect(current_path).to eq(login_path)
    expect(page).to have_content('Wrong Username or Password')
  end
end
