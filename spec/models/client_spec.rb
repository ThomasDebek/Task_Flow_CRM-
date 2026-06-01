require 'rails_helper'

RSpec.describe Client, type: :model do


  describe "validations" do
    it "is valid with valid attributes" do
      client = build(:client)

      expect(client).to be_valid
    end
  end

end
