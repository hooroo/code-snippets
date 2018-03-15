require "rails_helper"

RSpec.describe User, type: :model do
  it { is_expected.to have_secure_password }

  context "validations" do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_length_of(:username).is_at_least(4) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email) }

    it { is_expected.to validate_length_of(:password).is_at_least(8) }

    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe "#full_name" do
    it "returns the user's titleized full name" do
      user = build(:user, first_name: "foo", last_name: "bar")

      expect(user.full_name).to eq("Foo Bar")
    end
  end

  describe "#to_s" do
    it "calls #full_name returns the user's titleized full name" do
      user = build(:user, first_name: "foo", last_name: "bar")

      expect(user.to_s).to eq("Foo Bar")
    end
  end
end
