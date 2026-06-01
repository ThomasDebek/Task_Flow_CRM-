require 'rails_helper'

RSpec.describe Client, type: :model do


  describe "validations" do
    it "is valid with valid attributes" do
      client = build(:client)
      expect(client).to be_valid
    end

    it "requires a name" do
      client = build(:client, name: nil)
      client.valid?
      expect(client.errors[:name]).to include("can't be blank")
    end

    it "requires an email" do
      client = build(:client, email: nil)
      client.valid?
      expect(client.errors[:email]).to include("can't be blank")
    end

    it "requires a unique email" do
      create(:client, email: "<EMAIL>")
      client = build(:client, email: "<EMAIL>")
      client.valid?
      expect(client.errors[:email]).to include("has already been taken")
      end



  end
end
