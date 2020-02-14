# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.create(name: "lemon")

Ingredient.create(name: "mint leaves")

ice = Ingredient.new(name: "ice")
ice.save

moj = Cocktail.new(name: 'Mojito')
moj.save
Cocktail.create(name: 'Cuba libre')
Cocktail.create(name: 'Whisky Mule')

Dose.create!(cocktail: moj, ingredient: ice, description: '4 cubes à soupe')
