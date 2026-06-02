require 'rails_helper'

RSpec.describe Lead, type: :model do
  describe "associations" do
    it {should belong_to(:user)}
  end



  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:status) }
  end

  describe "#full_name" do
    it "returns the first name and last name " do
      lead = build(:lead)
      expect(lead.full_name).to eq("John Doe")
    end
  end

  describe "#next_status" do
    it "returns the next status in the sequence" do
      lead = build(:lead, status: "new")
      expect(lead.next_status).to eq("contacted")
    end

    it "returns qualified when status is contacted" do
      lead = build(:lead, status: "contacted")
      expect(lead.next_status).to eq("qualified")
    end

    it "returns nil when status is qualified" do
      lead = build(:lead, status: "qualified")
      expect(lead.next_status).to be_nil
    end

    it "returns nil when status is lost" do
      lead = build(:lead, status: "lost")
      expect(lead.next_status).to be_nil
    end
  end

  describe "#can_advance?" do
    it "returns true for new lead" do
      lead = build(:lead, status: "new")
      expect(lead.can_advance?).to be true
    end

    it "returns true for contacted lead" do
      lead = build(:lead, status: "contacted")
      expect(lead.can_advance?).to be true
    end

    it "returns false for qualified lead" do
      lead = build(:lead, status: "qualified")
      expect(lead.can_advance?).to be false
    end

    it "returns false for lost lead" do
      lead = build(:lead, status: "lost")
      expect(lead.can_advance?).to be false
    end

    it "allows only valid statuses" do
      lead = build(:lead, status: "invalid")

      expect(lead).not_to be_valid
      expect(lead.errors[:status]).to include("is not included in the list")
    end

  end
end
