require 'rails_helper'

RSpec.describe Note, type: :model do

  describe "associations" do
    it { should belong_to(:client) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
  end
end
