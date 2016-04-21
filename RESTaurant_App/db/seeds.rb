# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Itype.create(
    { description: 'Drink - Non-Alcoholic' },
    { description: 'Drink - Beer' },
    { description: 'Drink - Wine' },
    { description: 'Drink - Other' },
    { description: 'Appetizer' },
    { description: 'Entree' },
    { description: 'Dessert' },
    { description: 'Side' }
    )

end