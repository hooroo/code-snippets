require "rails_helper"

RSpec.describe Snippet do
  context "associations" do
    it { is_expected.to belong_to(:language) }
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:comments) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:user_id) }
    it { is_expected.to validate_presence_of(:language_id) }
  end
end
