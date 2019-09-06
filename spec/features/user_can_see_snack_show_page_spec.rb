require 'rails_helper'

RSpec.describe 'When a user visits a snack show page', type: :feature do
  before :each do
    @sam = Owner.create!(name: "Sam's Snacks")
    @drew = Owner.create!(name: "Drew's Drinks")

    @sam_machine_1  = @sam.machines.create!(location: "Don's Mixed Drinks")
    @drew_machine_1 = @drew.machines.create!(location: "Turing's Basement")

    @snack_1 = Snack.create!(name: "White Castle Burger", price: 3.5)
    @snack_2 = Snack.create!(name: "Pop Rocks", price: 1.5)
    @snack_3 = Snack.create!(name: "Flaming Hot Cheetos", price: 2.5)

    @sam_machine_1.snacks << @snack_1
    @sam_machine_1.snacks << @snack_2
    @sam_machine_1.snacks << @snack_3
    @drew_machine_1.snacks << @snack_1
  end

  # As a visitor
  # When I visit a snack show page
  # I see the name of that snack
  #   and I see the price for that snack
  #   and I see a list of locations with vending machines that carry that snack
  #   and I see the average price for snacks in those vending machines
  #   and I see a count of the different kinds of items in that vending machine.
  # ```
  #
  # ```
  # Flaming Hot Cheetos
  # Price: $2.50
  # Locations
  # * Don's Mixed Drinks (3 kinds of snacks, average price of $2.50)
  # * Turing Basement (2 kinds of snacks, average price of $3.00)

  it 'they see all pertinent info for that snack' do
    visit snack_path(@snack_1)

    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content("$3.50")
    expect(page).to have_content(@sam_machine_1.location)
    expect(page).to have_content("Average Item Price: $2.50")
    expect(page).to have_content("Kinds of Snacks: 3")


    expect(page).to have_content(@drew_machine_1.location)
    expect(page).to have_content("Average Item Price: $3.50")
    expect(page).to have_content("Kinds of Snacks: 1")
  end
end
