# frozen_string_literal: true
require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { User.new email: "testuser@example.com", username: "testuser" }

  describe "#to_param" do
    subject { user.to_param }

    it { is_expected.to eq user.username }
  end
end
