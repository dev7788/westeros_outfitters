# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
weapons = Category.create(name: "weapons")
armor = Category.create(name: "armor")
unique_items = Category.create(name: "unique items")

weapons.items.create(name: "Ice", img: "http://www.bigbadtoystore.com/images/products/out/large/VLS10000.jpg", price: "100.00", description: "this is a description")
weapons.items.create(name: "OathKeeper", img: "http://www.valyriansteel.com/shop/images/uploads/Damasc%20Oathkeeper%206.jpg ", price: "100.00", description: "this is a description")
weapons.items.create(name: "Longclaw", img: "http://www.valyriansteel.com/shop/images/uploads/Longclaw%202.jpg", price: 390.00, description: "this is a description")

armor.items.create(name: "Jamie's Armor", img: "http://screencrush.com/442/files/2016/01/lannd.jpg?w=720&cdnnode=1", price: 300.00, description: "this is a description")
armor.items.create(name: "Gendry's Helmet", img: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRI0WLZPDw1SJaB6BP_soSPAp5BbvENR3bId89zga3zZgcl7DSKVKAE0NU", price: 20.00, description: "this is a description")
armor.items.create(name: "Ned's Shield", img: "http://insidehboshop.hbo.com/wp-content/uploads/2013/07/Game-of-Thrones-Stark-Shield-Plaque-Exclusive.jpg", price: 120.00, description: "this is a description")

unique_items.items.create(name: "Ned's head", img: "http://cdn.foodbeast.com.s3.amazonaws.com/content/wp-content/uploads/2012/05/cake-of-thrones.jpg", price: 10.90, description: "Once of a kind.")
unique_items.items.create(name: "Hodor Door Stop", img: "https://img0.etsystatic.com/135/1/11291404/il_570xN.987828948_g5xv.jpg", price: 14.44, description: "this is a description")
unique_items.items.create(name: "Three Eyed Raven", img: "http://screenrant.com/wp-content/uploads/Game-of-Thrones-Three-Eyed-Raven-Cast.jpg", price: 15.44, description: "this is a description")
unique_items.items.create(name: "Direwolf", img: "http://vignette3.wikia.nocookie.net/gameofthrones/images/e/ec/Nymeria.jpg/revision/latest?cb=20141115023836", price: 15333.44, description: "Big Ass Dog", retired: true)
unique_items.items.create(name: "Dragon Eggs", img: "http://orig07.deviantart.net/b735/f/2012/078/a/8/dragon_eggs_by_elisa_erian-d4tb5db.jpg", price: 1538458433.74, description: "You'll be the mother of dragons", retired: true)


unique_items.items.create(name: "Ned's head", img: "http://notyourmommascookie.com/wp-content/uploads/2012/04/109.jpg", price: 10.90, description: "Once of a kind.")
