# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:event) { Event.new name: 'testevent', scheduled_at: Time.current }

  describe "#as_json" do
    let(:json) {
      {
        id: event.id,
        name: event.name,
        scheduled_at: event.scheduled_at,
        place: event.place,
        user_id: event.user_id,
        created_at: event.created_at,
        updated_at: event.updated_at
      }.stringify_keys
    }

    subject { event.as_json }

    it { is_expected.to eq json }
  end
end
