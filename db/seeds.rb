# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

MachineSnack.destroy_all
Snack.destroy_all
Machine.destroy_all
Owner.destroy_all

sam = Owner.create!(name: "Sam's Snacks")
drew = Owner.create!(name: "Drew's Drinks")

sam_machine_1 = sam.machines.create!(location: "Don's Mixed Drinks")
drew_machine_1 = drew.machines.create!(location: "Turing's Basement")

snack_1 = Snack.create!(name: "White Castle Burger", price: 3.5)
snack_2 = Snack.create!(name: "Pop Rocks", price: 1.5)
snack_3 = Snack.create!(name: "Flaming Hot Cheetos", price: 2.5)

sam_machine_1.snacks << snack_1
sam_machine_1.snacks << snack_2
sam_machine_1.snacks << snack_3
drew_machine_1.snacks << snack_1
