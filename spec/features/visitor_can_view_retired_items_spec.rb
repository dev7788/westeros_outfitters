require 'rails_helper'

RSpec.feature "Visitor can view retired items" do
  scenario "they see the retired items on the index page and click on then" do
    item = Item.create(name: "Direwolf", img: "image", price: 0.99, retired:true)
    visit items_path
    expect(page).to have_content(item.name)
    expect(page).to_not have_content("Add to Cart")

    click_on 'Item Retired'
    expect(current_path).to eq(item_path(item.id))
  end
end
