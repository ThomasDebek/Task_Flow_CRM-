require 'rails_helper'

RSpec.describe Client, type: :model do


  describe "validations" do
    it "is valid with valid attributes" do
      client = build(:client)

      expect(client).to be_valid
    end


    it "is requires a name" do
      client = build(:client, name: nil)

      expect(client).to be_invalid
    end


  end

end
