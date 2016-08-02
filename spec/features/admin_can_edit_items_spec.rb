# Background: an existing item
# As an admin
# When I visit "admin/items"
# And I click "Edit"
# Then my current path should be "/admin/items/:ITEM_ID/edit"
# And I should be able to upate title, description, image, and status
require 'rails_helper'

RSpec.feature 'Admin can edit an existing item' do
  scenario 'they can edit an item with valid attributes' do
    #code
  end
end
