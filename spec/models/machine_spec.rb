require 'rails_helper'

RSpec.describe Machine, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should belong_to :owner }
    it { should have_many :machine_snacks }
    it { should have_many(:snacks).through(:machine_snacks) }
  end

  describe "instance methods" do
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

    it "can calculate average price" do
      expect(@sam_machine_1.average_price).to eq(2.5)
    end
  end
end
