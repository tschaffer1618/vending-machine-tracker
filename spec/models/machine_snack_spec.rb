require 'rails_helper'

describe MachineSnack do
  describe "relationships" do
    it { should belong_to :snack }
    it { should belong_to :machine }
  end
end
