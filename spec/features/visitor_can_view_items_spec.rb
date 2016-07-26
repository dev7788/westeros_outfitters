require 'rails_helper'

RSpec.feature "Visitor can view items" do
  scenario "they see the items on the index page" do
    item = Item.create(name: "Ice", img: "image", price: 0.99)

    visit root_path

    expect(page).to have_content(item.name)
  end
end
