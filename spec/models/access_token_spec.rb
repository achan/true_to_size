require 'rails_helper'

RSpec.describe AccessToken, type: :model do
  describe "#create" do
    it "has a valid factory" do
      expect(create(:access_token)).to be_valid
    end

    it "generates a secure token" do
      expect(create(:access_token, token: nil).token.size).to eq(24)
    end

    it "requires a user" do
      expect { create(:access_token, user: nil) }.
        to raise_error ActiveRecord::RecordInvalid
    end
  end
end
