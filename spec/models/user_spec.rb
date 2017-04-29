require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#create" do
    it "has a valid factory" do
      expect(create(:user)).to be_valid
    end

    it "requires a password" do
      expect { create(:user, password: "") }.
        to raise_error ActiveRecord::RecordInvalid
    end

    it "requires a username" do
      expect { create(:user, username: "") }.
        to raise_error ActiveRecord::RecordInvalid
    end

    it "requires a unique username" do
      create(:user, username: "igotthisfirst")
      expect { create(:user, username: "Igotthisfirst") }.
        to raise_error ActiveRecord::RecordInvalid
    end

    it "doesn't allow usernames with spaces" do
      expect { create(:user, username: "i got this") }.
        to raise_error ActiveRecord::RecordInvalid
    end

    it "doesn't allow usernames with special characters" do
      "!@#$%^&*()_+-=".split("").each do |c|
        expect { create(:user, username: "igotthis#{c}") }.
          to raise_error ActiveRecord::RecordInvalid
      end
    end

    it "assigns the user a user status" do
      expect(create(:user, status: "admin").status).to eq "user"
    end

    it "requires a shoe size" do
      expect { create(:user, shoe_size: "") }.
        to raise_error ActiveRecord::RecordInvalid
    end
  end

  describe "#save" do
    let(:user) { create(:user) }

    it "does not allow updated usernames" do
      user.username = "newusername"
      expect(user).not_to be_valid
    end

    it "does not allow updated statuses" do
      user.status = "banned"
      expect(user).not_to be_valid
    end
  end
end
