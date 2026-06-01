require 'rails_helper'

RSpec.describe Client, type: :model do


  describe "validations" do
    it "is valid with valid attributes" do
      user = User.new(
        email: "test@example.com",
        password: "password123"
      )

      client = described_class.new(
        user: user,
        name: "Test Client",
        email: "john@dupabalad.pl",
        phone: "1234567890",
        company_name: "Test Company",
        status: "active"
      )

      expect(client).to be_valid
    end
  end

end
