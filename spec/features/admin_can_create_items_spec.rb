require 'rails_helper'

RSpec.feature 'Admin can create an item' do
  scenario 'they can create an item with valid attributes' do
    category = Category.create!(name: 'weapons')
    category = Category.create!(name: 'toys')
    admin = User.create!(id: 1, username: 'Hodor', password: 'holddoor', address: 'The Woods', email: 'hold@thedoor.com', role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit root_path

    click_on 'Add an Item'

    expect(current_path).to eq(new_admin_item_path)

    select 'toys', from: 'Category'
    fill_in 'Name', with: 'Direwolf Chew Toy'
    fill_in 'Price', with: 14.99
    fill_in 'Description', with: 'Give those loyal beasts something to play with.'
    fill_in 'Image', with: 'http://zanydoodles.com/shop/images/bones.jpg'
    click_button 'Submit'

    expect(current_path).to eq('/items/1')
    expect(page).to have_content('Direwolf Chew Toy')
    expect(page).to have_content('$14.99')
    expect(page).to have_content('Give those loyal beasts something to play with.')
    expect(page).to have_css ('img[src="http://zanydoodles.com/shop/images/bones.jpg"]')
  end

  scenario 'they are redirected back to Create Item page if missing attributes' do
    category = Category.create!(name: 'weapons')
    category = Category.create!(name: 'toys')
    admin = User.create!(id: 1, username: 'Hodor', password: 'holddoor', address: 'The Woods', email: 'hold@thedoor.com', role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_item_path

    select 'toys', from: 'Category'
    fill_in 'Image', with: 'http://zanydoodles.com/shop/images/bones.jpg'
    click_button 'Submit'

    expect(current_path).to eq('/admin/items')
    expect(page).to have_content("Name can't be blank. Price can't be blank. Price is not a number. Description can't be blank")
    expect(page).to have_content('Create a New Item')
  end

  scenario 'a default image is applied if no image is provided' do
    category = Category.create!(name: 'weapons')
    category = Category.create!(name: 'toys')
    admin = User.create!(id: 1, username: 'Hodor', password: 'holddoor', address: 'The Woods', email: 'hold@thedoor.com', role: 1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)

    visit new_admin_item_path

    select 'toys', from: 'Category'
    fill_in 'Name', with: 'Frisbee'
    fill_in 'Price', with: 15.99
    fill_in 'Description', with: 'Toss it around.'
    click_button 'Submit'

    expect(current_path).to eq('/items/2')
    expect(page).to have_content('Frisbee')
    expect(page).to have_content('$15.99')
    expect(page).to have_content('Toss it around.')
    expect(page).to have_css ('img[src="http://thelivingroom.cafe/wp-content/uploads/2016/01/coming-soon-product-image.png"]')
  end
end
