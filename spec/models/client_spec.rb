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


  describe "associations" do
    it "belongs to a user " do
      client = create(:client)
      expect(client.user).to be_a(User)
    end

    it "has many tasks" do
      client = create(:client)
      expect(client.tasks).to be_a(ActiveRecord::Relation)
    end


    it "has many notes" do
      client = create(:client)
      expect(client.notes).to be_a(ActiveRecord::Relation)
    end

    it "deletes associated tasks when destroyed" do
      client = create(:client)
      create(:task, client: client)

      expect { client.destroy }.to change(Task, :count).by(-1)
    end

    it "deletes associated notes when destroyed" do
      client = create(:client)
      create(:note, client: client)

      expect { client.destroy }.to change(Note, :count).by(-1)
    end


    it {should belong_to(:user)}
    it {should have_many(:tasks)}
    it {should have_many(:notes)}

  end




end
