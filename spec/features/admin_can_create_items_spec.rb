# As an authenticated Admin:
# I can create an item.
# - An item must have a title, description and price.
# - An item must belong to at least one category.
# - The title and description cannot be empty.
# - The title must be unique for all items in the system.
# - The price must be a valid decimal numeric value and greater than zero.
# - The photo is optional. If not present, a stand-in photo is used. (PAPERCLIP)
require 'rails_helper'

RSpec.feature 'Admin can create an item' do
  scenario 'they can create an item with valid attributes' do
    #code
  end

  scenario 'they are redirected back to Create Item page if missing attributes' do
    #code
  end

  scenario 'a default image is applied if no image is provided' do
    #code
  end
end
