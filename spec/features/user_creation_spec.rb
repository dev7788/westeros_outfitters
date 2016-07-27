require 'rails_helper'

RSpec.feature "Visitor can create a user" do
  scenario "they can create a username" do
    visit login_path

    fill_in "Username", with: "matt"

    visit items_path

    expect(page).to have_content(item.name)
  end
end
