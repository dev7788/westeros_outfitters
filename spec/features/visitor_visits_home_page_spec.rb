require 'rails_helper'

RSpec.feature 'Visitor can see the home page' do
  scenario "they can see the nav bar" do
    visit '/'

    expect(page).to have_content("View Cart")
    expect(page).to have_content("Items")
    expect(page).to have_content("Create An Account")
    expect(page).to have_content("Login")
  end
end
