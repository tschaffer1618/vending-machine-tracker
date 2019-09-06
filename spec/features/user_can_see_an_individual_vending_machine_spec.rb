require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  before :each do
    @sam = Owner.create!(name: "Sam's Snacks")
    @sam_machine_1  = @sam.machines.create!(location: "Don's Mixed Drinks")
    @snack_1 = Snack.create!(name: "White Castle Burger", price: 3.5)
    @snack_2 = Snack.create!(name: "Pop Rocks", price: 1.5)
    @snack_3 = Snack.create!(name: "Flaming Hot Cheetos", price: 2.5)
    @sam_machine_1.snacks << @snack_1
    @sam_machine_1.snacks << @snack_2
    @sam_machine_1.snacks << @snack_3
  end

  it 'they see the location of that machine and its contents' do
    visit machine_path(@sam_machine_1)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
    expect(page).to have_content(@snack_1.name)
    expect(page).to have_content("$3.50")
    expect(page).to have_content(@snack_2.name)
    expect(page).to have_content("$1.50")
    expect(page).to have_content(@snack_3.name)
    expect(page).to have_content("$2.50")

    expect(page).to have_content("Average Item Price: $2.50")
  end
end
