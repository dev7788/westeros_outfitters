require 'rails_helper'

RSpec.feature 'User who is an admin can see admin dashboard' do
  scenario 'they get redirected to admin/dashbaord after logging in' do
    user= User.create(username:"Admin1", password:"test", address:"admin street",email:"admin.com",role:"admin")
    visit login_path
    fill_in "Username", with: "Admin1"
    fill_in "Password", with: "test"
    click_button "Login"

    expect(page).to have_content("Hello, Admin1.")

    expect(current_path).to eq ("/admin/dashboard")

    expect(page).to have_content('Admin Dashboard')
    expect(page).to have_content('Edit User Profile')

  end

  scenario 'they get redirected to admin/dashbaord after logging in' do

      user= User.create(username:"Test", password:"test", address:"test street",email:"test.com")
      visit login_path
      fill_in "Username", with: "Test"
      fill_in "Password", with: "test"
      click_button "Login"
      visit admin_dashboard_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
end
end
