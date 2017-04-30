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

    it "requires a size class" do
      expect(build(:shoe, size_class: "")).not_to be_valid
    end

    it "requires a brand" do
      expect(build(:shoe, brand: "")).not_to be_valid
    end

    it "only accepts :men or :women size classes" do
      expect { build(:shoe, size_class: :aliens) }.to raise_error ArgumentError
      expect(build(:shoe, size_class: :men)).to be_valid
      expect(build(:shoe, size_class: :women)).to be_valid
    end
  end

  describe "#slug" do
    let!(:shoe) { create(:shoe, name: "my unique shoe") }

    context "with a unique shoe name" do
      it "slugifies the name" do
        expect(shoe.slug).to eq "my-unique-shoe"
      end
    end
  end
end
