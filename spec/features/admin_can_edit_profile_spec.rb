require 'rails_helper'


RSpec.feature 'User who is an admin can see admin dashboard' do
  scenario 'they get redirected to admin/dashbaord after logging in' do
    user= User.create(username:"Admin1", password:"test", address:"admin street",email:"admin.com",role:"admin")
    visit login_path
    fill_in "Username", with: "Admin1"
    fill_in "Password", with: "test"
    click_button "Login"

    expect(page).to have_content("Hello, Admin1.")

    click_link 'Edit User Profile'

    fill_in "Username", with: "Admin1"
    fill_in "Password", with: "test"
    fill_in "Email", with: "@admin"
    fill_in "Address", with: "that one place"
    click_button "Update User"

    expect(current_path).to eq ("/admin/dashboard")
    expect(page).to have_content('Admin Dashboard')
    expect(page).to have_content('@admin')
    expect(page).to have_content('that one place')

  end
end 
