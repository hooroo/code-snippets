require "rails_helper"

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:commentable) }

  context "validations" do
    it { is_expected.to validate_presence_of(:body) }
    it { is_expected.to validate_presence_of(:commentable_type) }
    it { is_expected.to validate_presence_of(:commentable_id) }
  end
end
