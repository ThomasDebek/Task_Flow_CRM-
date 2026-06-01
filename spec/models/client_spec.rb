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

    it "requires a unique name" do
      create(:client, name: "Existing Client")
      client = build(:client, name: "Existing Client")
      client.valid?
      expect(client.errors[:name]).to include("has already been taken")
    end

    it "requires a unique email" do
      create(:client, email: "admin@example.com")
      client = build(:client, email: "admin@example.com")
      client.valid?
      expect(client.errors[:email]).to include("has already been taken")
    end

    it "requires a phone" do
      client = build(:client, phone: nil)
      client.valid?
      expect(client.errors[:phone]).to include("can't be blank")
    end

    it "requires a company_name" do
      client = build(:client, company_name: nil)
      client.valid?
      expect(client.errors[:company_name]).to include("can't be blank")
    end

    it "requires a status" do
      client = build(:client, status: nil)
      client.valid?
      expect(client.errors[:status]).to include("can't be blank")
    end









  end
end
