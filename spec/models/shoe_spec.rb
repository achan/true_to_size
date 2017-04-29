require 'rails_helper'

RSpec.describe Shoe, type: :model do
  describe "validations" do
    it "has a valid factory" do
      expect(create(:shoe)).to be_valid
    end

    it "requires a name" do
      expect(build(:shoe, name: "")).not_to be_valid
    end

    it "requires a model" do
      expect(build(:shoe, model: "")).not_to be_valid
    end

    it "requires a type" do
      expect(build(:shoe, type: "")).not_to be_valid
    end

    it "requires a brand" do
      expect(build(:shoe, brand: "")).not_to be_valid
    end

    it "only accepts :men or :women types" do
      expect { build(:shoe, type: :aliens) }.to raise_error ArgumentError
      expect(build(:shoe, type: :men)).to be_valid
      expect(build(:shoe, type: :women)).to be_valid
    end
  end
end
