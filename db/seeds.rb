# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Machine.destroy_all
Owner.destroy_all

don = Owner.create!(name: Don)

mixed_drinks = dom.machines.create!(location: Denver)

# ```Don's Mixed Drinks
# Snacks
# * White Castle Burger: $3.50
# * Pop Rocks: $1.50
# * Flaming Hot Cheetos: $2.50
# Average Price: $2.50
