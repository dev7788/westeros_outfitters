require "rails_helper"

RSpec.feature "admin goes to dashboard" do
  scenario "can only edit own info" do
    user = User.create!(id: 1, username: "ned", password: "password", address: "12", email: "132", role: 1)
    user = User.create!(id: 2, username: "ned1", password: "password", address: "12", email: "1132", role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit admin_dashboard_path

    expect(current_path).to eq(admin_dashboard_path)

    click_link "Edit User Profile"
    expect(current_path).to eq("/admin/users/2/edit")
    visit "/admin/users/1/edit"
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
