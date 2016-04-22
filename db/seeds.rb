# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


drink_na = Itype.create(description: 'Drink - Non-Alcoholic')
drink_b = Itype.create(description: 'Drink - Beer')
drink_w = Itype.create(description: 'Drink - Wine')
drink_o = Itype.create(description: 'Drink - Other')
appetizer = Itype.create(description: 'Appetizer')
entree = Itype.create(description: 'Entree')
dessert = Itype.create(description: 'Dessert')
side = Itype.create(description: 'Side')



Item.create([
    { description: 'Cold Brew Iced Coffee', price: 2.75, itype_id: drink_na.id },
    { description: 'Southern Tier Pumking', price: 7.50, itype_id: drink_b.id },
    { description: 'Underwood Pinot Noir (Can)', price: 4.50, itype_id: drink_w.id },
    { description: 'Fried Mac & Cheese Bites', price: 8.85, itype_id: appetizer.id },
    { description: 'Baked Stuffed Mushrooms', price: 8.00, itype_id: appetizer.id },
    { description: 'Arugula & Truffle Pizza', price: 14.25, itype_id: entree.id },
    { description: 'Penne alla Vodka & Peas', price: 13.00, itype_id: entree.id },
    { description: 'Sticky Toffee Pudding', price: 6.50, itype_id: dessert.id },
    { description: 'Pumpkin Pie a la Mode', price: 4.95, itype_id: dessert.id },
    { description: 'Roasted Brussel Sprouts', price: 4.25, itype_id: side.id },
    { description: 'Sweet Potato Casserole', price: 3.75, itype_id: side.id }
])